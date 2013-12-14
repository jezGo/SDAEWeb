# Create your views here.

from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404
from publications.models import Publication
from django.contrib.auth.models import User
from publications.models import Publication, SDAEUser, UserType, Company, Vote, Recomendation
from publications.forms import RegisterForm, CompanyForm, UserForm
from publications import views
from django.template import RequestContext

# Home Page View
def home(request):
  highlightedPublications = Publication.objects.order_by("published")[:5]

  publications = []

  for publication in highlightedPublications:
  	detailedInfoUrl = '#'

  	if publication.type.name == 'Anuncio':
  		detailedInfoUrl = '/publications/advertisement/' + str(publication.pk)
  	elif publication.type.name == 'Evento':
  		detailedInfoUrl = '/publications/events/' + str(publication.pk)
  	elif publication.type.name == 'Oferta de Empleo':
  		detailedInfoUrl = '/publications/joboffers/' + str(publication.pk)
  	elif publication.type.name == 'Encontrado-Perdido':
  		detailedInfoUrl = '/publications/lostfound/' + str(publication.pk)
  	elif publication.type.name == 'Compra-Venta':
  		detailedInfoUrl = '/publications/buysell/' + str(publication.pk)

  	publication.detailedInfoUrl = detailedInfoUrl
  	publications.append(publication)

  context = {
  'publicationIndexes':range(len(highlightedPublications)),
  'highlightedPublications': publications,
   }

  return render(request,'publications/home.html', context)

def private(request):
    usuarios=SDAEUser.objects.all()
    publicationList = Publication.objects.all()
    publicationList.author = SDAEUser.objects.get(user = request.user)
    context={'usuarios': usuarios,  'publicationList ': publicationList }
    return render(request,'registration/privado.html', context)

# Register User
def registerUser(request):
	if request.method != 'POST':
		registerForm = RegisterForm()
	else:
		registerForm = RegisterForm(request.POST)

		if registerForm.is_valid():
			# Calling a custom save method. Defined in forms view
			user = registerForm.save()

			return HttpResponseRedirect("/login/")

	return render(request, 'registration/register.html', {'registerForm':registerForm})

# Register Company
def registerCompany(request):
  if request.method != 'POST':
    cForm = CompanyForm()
    uForm = UserForm()
  else:
    cForm = CompanyForm(request.POST)
    uForm = UserForm(request.POST)

    if cForm.is_valid() and uForm.is_valid():
      user = uForm.save(commit=False)
      user.is_active =False
      user.save()
      sdaeUser = SDAEUser(user=user, type=UserType.objects.get(name="Empresa"))
      sdaeUser.save()
      company = cForm.save(commit = False)

      company.sdaeUser = sdaeUser

      company.save()

      return HttpResponseRedirect("/login/")

  return render(request, 'registration/register_company.html', {'cForm':cForm, 'uForm':uForm})

  # Get Recomendations list
def getRecomendations(targetUser):
  users = SDAEUser.objects.all()
  publications = Publication.objects.all()
  targetUserVotes = Vote.objects.filter(author=targetUser)

  if len(targetUserVotes) == 0:
    return []

  targetUserVotesDict = {}
  userSimilarity = {}

  for vote in targetUserVotes:
    targetUserVotesDict[vote.publication] = vote

  for user in users:
    if user == targetUser:
      continue

    userSimilarity.setdefault(user, 0)
    userVotes = Vote.objects.filter(author=user)

    for publication in publications:
      for vote in userVotes:
        # print str(vote.isPositive) + " " + str(vote)
        if vote.publication == publication:
          targetVote = targetUserVotesDict.get(publication)
          if targetVote != None and targetVote.isPositive == vote.isPositive:
            userSimilarity[user] += 1

  #Get the users with the most similar user votes to the target user
  maxSim = max(userSimilarity.values())

  similarUsers = []
  for k, v in userSimilarity.iteritems():
    if v == maxSim:
      similarUsers.append(k)

  recomendations = []
  for similarUser in similarUsers:
    referenceUserVotes = Vote.objects.filter(author=similarUser)

    recomendationsScore = {}

    for referenceVote in referenceUserVotes:
      if targetUserVotesDict.get(referenceVote.publication) == None:
        if recomendationsScore.get(referenceVote.publication) == None:
          recomendationsScore.setdefault(referenceVote.publication, 0)
        if referenceVote.isPositive:
          recomendationsScore[referenceVote.publication] += 1
        else:
          recomendationsScore[referenceVote.publication] -= 1

  for publication, score in recomendationsScore.iteritems():
    if score >= 0:
      recomendations.append(publication)

  return recomendations

# View with a list of recommended items
def recomendations(request):
  if request.method != "POST":
    recomendations = Recomendation.objects.filter(sdaeuser = request.user.sdaeuser, isRead = False)

    return render(request, 'publications/recomendations.html', {'recomendations':recomendations})
  else:
    recomendationId = request.POST["recomendationId"]

    readedRecomendation = Recomendation.objects.get(pk=recomendationId)
    readedRecomendation.isRead = True
    readedRecomendation.save()

    recomendations = Recomendation.objects.filter(sdaeuser = request.user.sdaeuser, isRead = False)

    return render(request, 'publications/recomendations.html', {'recomendations':recomendations})

# Create recomendations registers in DB
def createRecomendations(request):
  if not request.user.is_staff:
    return HttpResponseRedirect("/home/")

  users = SDAEUser.objects.all()

  recsCount = 0

  for user in users:
    recsCount += createRecomendationsForUser(user)

  return HttpResponse("created " + str(recsCount) + " recomendations")

def createRecomendationsForUser(user):
  recomendations = getRecomendations(user)

  recsCount = 0

  for recomendation in recomendations:
    existingRecomendations = Recomendation.objects.filter(sdaeuser = user)
    publicationsFromExistingRecs = []
    for existingRec in existingRecomendations:
      publicationsFromExistingRecs.append(existingRec.publication)
    if not recomendation in publicationsFromExistingRecs:
      recsCount += 1
      r = Recomendation(sdaeuser = user, publication=recomendation)
      r.save()
  return recsCount
