# Create your views here.

from django.http import HttpResponse, HttpResponseRedirect, HttpResponseForbidden
from django.shortcuts import render, get_object_or_404
from publications.models import Publication, Event, PublicationType, SDAEUser, Tag, Comment, LostAndFound, JobOffer, Vote, BuySell, Company,   Advertisement, CourseMaterial
from publications.forms import  PublicationForm, EventForm, CommentForm, LostFoundForm,   AdvertisementForm, JobOfferForm, CourseMaterialForm, BuySellForm,  PublicationTypeForm, TagForm,CompanyForm
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.core.mail import EmailMessage
from django.contrib import admin
from django.db.models import Q
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, authenticate, logout


# Publication types list
def publications(request):
  publicationTypesList = PublicationType.objects.all()

  context = {'publicationTypesList': publicationTypesList}

  return render(request, 'publications/publications.html', context)

# Create Publication
# @login_required(login_url='/login/')
# def createPublication(request):
# 	if request.method != 'POST':
# 		form = PublicationForm()
# 	else:
# 		form = PublicationForm(request.POST)
# 		if form.is_valid():
# 			return HttpResponseRedirect('/publications/')
# 	return render(request, 'publications/publications_create.html', {'form': form})

# Vote Publication
@login_required(login_url='/login/')
def votePublication(request):
	if request.method != 'POST':
		return HttpResponseRedirect("/")

	publicationId = request.POST['publicationId']
	publication = get_object_or_404(Publication, pk=publicationId)

	su = request.user.sdaeuser

	previousVote = None
	try:
		previousVote = Vote.objects.get(publication=publication, author=request.user.sdaeuser)
	except:
		previousVote = None

	isPositive = True
	if (request.POST["voteValue"] == "-1"):
		isPositive = False

	if previousVote and not previousVote.isPositive == isPositive:
		previousVote.isPositive = isPositive
		previousVote.save()
	else:
		vote = Vote(publication=publication, author=request.user.sdaeuser, isPositive=isPositive)
		vote.save()

	referer = request.META['HTTP_REFERER']

	return HttpResponseRedirect(referer[:referer.rfind('/')])

# Delete Publication
@login_required(login_url='/login/')
def deletePublication(request):
	if request.method != 'POST':
		return HttpResponseRedirect('/publications/')

	publicationId = request.POST['publicationId']
	publication = Publication.objects.get(pk=publicationId)
	publication.delete()

	try:
		event = publication.event
		event.delete()
	except:
		pass	

	try:
		lostandfound = publication.lostandfound
		lostandfound.delete()
	except:
		pass
	try:
		buysell = publication.buysell
		buysell.delete()
	except:
		pass	
	try:
		joboffer = publication.joboffer
		joboffer.delete()
	except:
		pass
	try:
		advertisement = publication.advertisement
		advertisement.delete()
	except:
		pass	

	referer = request.META['HTTP_REFERER']

	return HttpResponseRedirect(referer[:referer.rfind('/')])

# Events List
def events(request):
	if request.user.sdaeuser.type.name == 'Empresa':
		return HttpResponseRedirect('/home/')
	eventsList = Event.objects.all()

	context = {'eventsList' : eventsList}

	return render(request, 'publications/events.html', context)

# Event details
def eventDetails(request, eventId):
	event = get_object_or_404(Publication, pk=eventId).event

	if request.method != 'POST':
		commentForm = CommentForm()
	else:
		commentForm = CommentForm(request.POST)
		if commentForm.is_valid():
			comment = commentForm.save(commit = False)

			comment.publication = Publication.objects.get(pk=event.publication.id)
			comment.author = SDAEUser.objects.get(user = request.user)

			comment.save()

	if not request.user.is_authenticated():
		isAuthor = False
		userVote = None
	else:
		# requestUser = SDAEUser.objects.get(user=request.user)
		requestUser = request.user.sdaeuser
		try:
			userVote = Vote.objects.get(author=requestUser, publication=event.publication)
		except:
			userVote = None

		publicationAuthor = event.publication.author
		isAuthor = (requestUser == event.publication.author)

	blockPositiveVote = False
	blockNegativeVote = False

	if userVote:
		if userVote.isPositive:
			blockPositiveVote = True
		else:
			blockNegativeVote = True

	publicationPoints = len(event.publication.vote_set.filter(isPositive=True)) - len(event.publication.vote_set.filter(isPositive=False))

	context = {
	'event': event,
	'publication': event.publication,
	'publicationPoints': publicationPoints,
	'blockPositiveVote': blockPositiveVote,
	'blockNegativeVote': blockNegativeVote,
	'isAuthor': isAuthor,
	'commentForm': commentForm,
	}

	return render(request, 'publications/event_details.html', context)

# Save Event (Aux Function)
def saveEvent(eform, pform, user):
	publication = pform.save(commit = False)

	publicationAuthor = SDAEUser.objects.get(user=user)
	publicationType = PublicationType.objects.get(name='Evento')
	publication.type = publicationType
	publication.author = publicationAuthor
	publication.save()
	pform.save_m2m()
	
	event = eform.save(commit = False)

	event.publication = publication
	event.save()

	eform.save_m2m()

# Save Tag(Aux Function)
def saveTag(tgform,user):
	tag = tgform.save(commit = False)
	tag.save()

# Create Tag
@login_required(login_url='/login/')
def createTag(request):
	if request.method != 'POST':
		tgform = TagForm()
		
	else:
		tgform = TagForm(request.POST)


		if tgform.is_valid():
			saveTag( tgform, request.user)

			return HttpResponseRedirect('/publications/')

	return render(request, 'publications/tag_form.html', {'tgform':tgform})



# Create Event
@login_required(login_url='/login/')
def createEvent(request):
	if request.user.sdaeuser.type.name != 'Departamento Escolar':
		return HttpResponseRedirect('/home/')

	if request.method != 'POST':
		pform = PublicationForm()
		eform = EventForm()
	else:
		pform = PublicationForm(request.POST, request.FILES)
		eform = EventForm(request.POST)

		if pform.is_valid() and eform.is_valid():
			saveEvent(eform, pform, request.user)

			return HttpResponseRedirect('/publications/events')

	return render(request, 'publications/events_create.html', {'pform':pform, 'eform':eform})

# Edit event
@login_required(login_url='/login/')
def editEvent(request, eventId):
	if request.user.sdaeuser.type.name != 'Departamento Escolar':
		return HttpResponseRedirect('/home/')
	publication = get_object_or_404(Publication, pk=eventId)

	if publication.author.user != request.user:
		return HttpResponseForbidden()

	event = publication.event

	if request.method != 'POST':
			pform = PublicationForm(instance=publication)
			eform = EventForm(instance=event)
	else:
		pform = PublicationForm(request.POST, instance = publication)
		eform = EventForm(request.POST, instance = event)

		if pform.is_valid() and eform.is_valid():
			saveEvent(eform, pform, request.user)

			return HttpResponseRedirect('/publications/events')

	return render(request, 'publications/events_create.html', {'pform':pform, 'eform':eform})

#lostandfound List
@login_required(login_url='/login/')
def LostandFound(request):
	if request.user.sdaeuser.type.name == 'Empresa':
		return HttpResponseRedirect('/home/')
	lostandfoundList = LostAndFound.objects.all()
	context = {'lostandfoundList': lostandfoundList}
	return render(request, 'publications/foundlost.html', context)

# Lost and Found details
def LostAndFoundDetails(request,lostandfoundID):
		
	lostandfound = get_object_or_404(Publication, pk=lostandfoundID).lostandfound

	if request.method != 'POST':
		commentForm = CommentForm()
	else:
		commentForm = CommentForm(request.POST)
		if commentForm.is_valid():
			comment = commentForm.save(commit = False)

			comment.publication = Publication.objects.get(pk=lostandfound.publication.id)
			comment.author = SDAEUser.objects.get(user = request.user)

			comment.save()

	if not request.user.is_authenticated():
		isAuthor = False
		userVote = None
	else:
		# requestUser = SDAEUser.objects.get(user=request.user)
		requestUser = request.user.sdaeuser
		try:
			userVote = Vote.objects.get(author=requestUser, publication=lostandfound.publication)
		except:
			userVote = None

		publicationAuthor = lostandfound.publication.author
		isAuthor = (requestUser == lostandfound.publication.author)

	blockPositiveVote = False
	blockNegativeVote = False

	if userVote:
		if userVote.isPositive:
			blockPositiveVote = True
		else:
			blockNegativeVote = True

	publicationPoints = len(lostandfound.publication.vote_set.filter(isPositive=True)) - len(lostandfound.publication.vote_set.filter(isPositive=False))

	context = {
	'lostandfound': lostandfound,
	'publication': lostandfound.publication,
	'publicationPoints': publicationPoints,
	'blockPositiveVote': blockPositiveVote,
	'blockNegativeVote': blockNegativeVote,
	'isAuthor': isAuthor,
	'commentForm': commentForm,
	}

	return render(request, 'publications/foundlost_details.html', context)



#SAVE lostandfound
def savelostandfound(lform, pform, user):
	publication = pform.save(commit = False)

	publicationAuthor = SDAEUser.objects.get(user=user)
	publicationType = PublicationType.objects.get(name='Perdido/Encontrado')
	publication.type = publicationType

	publication.author = publicationAuthor
	publication.save()
	pform.save_m2m()

	lostandfound = lform.save(commit = False)

	lostandfound.publication = publication
	lostandfound.save()

	lform.save_m2m()

# Create lostandfound
@login_required(login_url='/login/')
def createLostAndFound(request):
	if request.method != 'POST' :
		pform = PublicationForm()
		lform = LostFoundForm()
	else:
		pform = PublicationForm(request.POST)
		lform = LostFoundForm(request.POST)
		if pform.is_valid() and lform.is_valid():

			savelostandfound(lform, pform, request.user)

			return HttpResponseRedirect('/publications/lostandfound')
	return render(request, 'publications/foundlost_create.html', {'pform':pform, 'lform':lform})

# Edit lostandfound
@login_required(login_url='/login/')
def editLostAndFound(request, lostandfoundId):
	
		publication = get_object_or_404(Publication, pk=lostandfoundId)

		if publication.author.user != request.user:
			return HttpResponseForbidden()

		lostandfound= publication.lostandfound

		if request.method != 'POST':
				pform = PublicationForm(instance=publication)
				lform = LostFoundForm(instance=lostandfound)
		else:
				pform = PublicationForm(request.POST, instance = publication)
				lform = LostFoundForm(request.POST, instance = lostandfound)

		if pform.is_valid() and lform.is_valid():
				savelostandfound(lform, pform, request.user)

				return HttpResponseRedirect('/publications/lostandfound')

		return render(request, 'publications/foundlost_create.html', {'pform':pform, 'lform':lform})

#SAVE BUYSELL
def saveBuySell(bform, pform, user):

	publication = pform.save(commit = False)

	publicationAuthor = SDAEUser.objects.get(user=user)
	publicationType = PublicationType.objects.get(name='Compra/Venta')
	publication.type = publicationType
	publication.author = publicationAuthor
	publication.save()
	pform.save_m2m()

	buysell = bform.save(commit = False)

	buysell.publication = publication
	buysell.save()

	bform.save_m2m()

#SAVE Advertisement
def saveAdvertisement(aform, pform, user):
	publication = pform.save(commit = False)

	publicationAuthor = SDAEUser.objects.get(user=user)
	publicationType = PublicationType.objects.get(name='Anuncio')
	publication.type = publicationType
	publication.author = publicationAuthor
	publication.save()
	pform.save_m2m()

	advertisement = aform.save(commit = False)

	advertisement.publication = publication
	advertisement.save()

	aform.save_m2m()

#SAVE MAterial
def saveCourseMaterial(cmform, pform, user):
	publication = pform.save(commit = False)

	publicationAuthor = SDAEUser.objects.get(user=user)
	publicationType = PublicationType.objects.get(name='Material')
	publication.type = publicationType
	publication.author = publicationAuthor
	publication.save()
	pform.save_m2m()

	coursematerial = cmform.save(commit = False)

	coursematerial.publication = publication
	coursematerial.save()

	cmform.save_m2m()

#SAVE JOBOFFER
def saveJobOffer(jform, pform,  user):
	publication = pform.save(commit = False)
	

	publicationAuthor = SDAEUser.objects.get(user=user)
	publicationType = PublicationType.objects.get(name='Oferta Laboral')
	publication.type = publicationType
	publication.author = publicationAuthor
	publication.save()

	pform.save_m2m()

	joboffer = jform.save(commit = False)

	joboffer.publication = publication
	joboffer.save()

	jform.save_m2m()

#Company List
def company(request):
	companyList = Company.objects.all()
	context = {'companyList' : companyList}
	return render(request, 'publications/company.html', context)



#JobOffer List
@login_required(login_url='/login/')
def joboffer(request):
	jobofferList =JobOffer.objects.all()
	context = {'jobofferList' : jobofferList}
	return render(request, 'publications/joboffer.html', context)


# Create JobOffer
@login_required(login_url='/login/')
def createJobOffer(request):
		if request.user.sdaeuser.type.name != 'Empresa':
			return HttpResponseRedirect('/home/')
		if request.method != 'POST' :
			pform = PublicationForm()
			jform = JobOfferForm()
			
		else:
			pform = PublicationForm(request.POST)
			jform = JobOfferForm(request.POST)
			
			if pform.is_valid() and jform.is_valid():

				saveJobOffer(jform,  pform, request.user)

			return HttpResponseRedirect('/publications/joboffer')
		return render(request, 'publications/joboffer_create.html', {'pform':pform, 'jform':jform})

#Create DetailsJobOffer
def JobOfferDetail(request, jobofferID):
	joboffer = get_object_or_404(Publication, pk=jobofferID).joboffer
	if request.method != 'POST':
		commentForm = CommentForm()
	else:
		commentForm = CommentForm(request.POST)
		if commentForm.is_valid():
			comment = commentForm.save(commit = False)

			comment.publication = Publication.objects.get(pk=joboffer.publication.id)
			comment.author = SDAEUser.objects.get(user = request.user)

			comment.save()

	if not request.user.is_authenticated():
		isAuthor = False
		userVote = None
	else:
		# requestUser = SDAEUser.objects.get(user=request.user)
		requestUser = request.user.sdaeuser
		try:
			userVote = Vote.objects.get(author=requestUser, publication=joboffer.publication)
		except:
			userVote = None

		publicationAuthor = joboffer.publication.author
		isAuthor = (requestUser == joboffer.publication.author)

	blockPositiveVote = False
	blockNegativeVote = False

	if userVote:
		if userVote.isPositive:
			blockPositiveVote = True
		else:
			blockNegativeVote = True

	publicationPoints = len(joboffer.publication.vote_set.filter(isPositive=True)) - len(joboffer.publication.vote_set.filter(isPositive=False))

	context = {
	'joboffer': joboffer,
	'publication':joboffer.publication,
	'publicationPoints': publicationPoints,
	'blockPositiveVote': blockPositiveVote,
	'blockNegativeVote': blockNegativeVote,
	'isAuthor': isAuthor,
	'commentForm': commentForm,
	}
	return render(request, 'publications/joboffer_details.html', context)

#BuySell List
@login_required(login_url='/login/')
def buysell(request):
	if request.user.sdaeuser.type.name == 'Empresa':
		return HttpResponseRedirect('/home/')
	buysellList = BuySell.objects.all()
	context = {'buysellList' : buysellList}
	return render(request, 'publications/buysell.html', context)


# Create BuySell
@login_required(login_url='/login/')
def createBuySell(request):
	if request.method != 'POST':
		pform = PublicationForm()
		bform = BuySellForm()
	else:
		pform = PublicationForm(request.POST)
		bform = BuySellForm(request.POST)

		if pform.is_valid() and bform.is_valid():
			saveBuySell(bform, pform, request.user)

			return HttpResponseRedirect('/publications/buysell')

	return render(request, 'publications/buysell_create.html', {'pform':pform, 'bform':bform})

# Edit buysell
@login_required(login_url='/login/')
def EditBuySell(request, buysellID):
	
		publication = get_object_or_404(Publication, pk=buysellID)

		if publication.author.user != request.user:
			return HttpResponseForbidden()

		buysell= publication.buysell

		if request.method != 'POST':
				pform = PublicationForm(instance=publication)
				bform = BuySellForm(instance=buysell)
		else:
				pform = PublicationForm(request.POST, instance = publication)
				bform =  BuySellForm(request.POST, instance =buysell)

		if pform.is_valid() and bform.is_valid():
				saveBuySell(bform, pform, request.user)

				return HttpResponseRedirect('/publications/buysell')

		return render(request, 'publications/buysell_create.html', {'pform':pform, 'bform':bform})


#Create DetailsBuySell
@login_required(login_url='/login/')
def BuySellDetail(request,buysellID):
	buysell = get_object_or_404(Publication, pk=buysellID).buysell

	if request.method != 'POST':
		commentForm = CommentForm()
	else:
		commentForm = CommentForm(request.POST)
		if commentForm.is_valid():
			comment = commentForm.save(commit = False)

			comment.publication = Publication.objects.get(pk=buysell.publication.id)
			comment.author = SDAEUser.objects.get(user = request.user)

			comment.save()

	if not request.user.is_authenticated():
		isAuthor = False
		userVote = None
	else:
		# requestUser = SDAEUser.objects.get(user=request.user)
		requestUser = request.user.sdaeuser
		try:
			userVote = Vote.objects.get(author=requestUser, publication=buysell.publication)
		except:
			userVote = None

		publicationAuthor = buysell.publication.author
		isAuthor = (requestUser == buysell.publication.author)

	blockPositiveVote = False
	blockNegativeVote = False

	if userVote:
		if userVote.isPositive:
			blockPositiveVote = True
		else:
			blockNegativeVote = True

	publicationPoints = len(buysell.publication.vote_set.filter(isPositive=True)) - len(buysell.publication.vote_set.filter(isPositive=False))

	context = {
	'buysell': buysell,
	'publication':buysell.publication,
	'publicationPoints': publicationPoints,
	'blockPositiveVote': blockPositiveVote,
	'blockNegativeVote': blockNegativeVote,
	'isAuthor': isAuthor,
	'commentForm': commentForm,
	}
	return render(request, 'publications/buysell_details.html', context)


def search_form(request):
	return render(request,'publications/events.html')

# Search
def search(request):
	if 'q' in request.GET and request.GET['q']:
		q = request.GET['q']
		publication=Publication.objects.filter(title__icontains=q)
		return render(request,'publications/search.html/', {'publication': publication, 'query': q})
	else:
		return render_to_response('publications/events.html', {'error': True})


def bad_search(request):
	message = 'You searched for: %r' % request.GET['q']
	return HttpResponse(message)

def tags(request):

	tags = Tag.objects.filter(Tag.name)

	return render_to_response('publications/list.html', {'tags': tags})


def tagSelect(request):
	if request.method != 'GET':
		tags = Tag.name	
		tform = TagForm(instance=tags)
	else:
		tform = TagForm(request.POST, instance = tags)


		return HttpResponseRedirect('/publications/events')

	return render(request, 'publications/events.html', {'tform':tform})


def advertisement(request):
	if request.user.sdaeuser.type.name == 'Empresa':
		return HttpResponseRedirect('/home/')

	advertisementList= Advertisement.objects.all()
	return render(request, 'publications/advertisement.html', {'advertisementList':advertisementList})


def createAdvertisement(request):
	if request.user.sdaeuser.type.name != 'Departamento Escolar':
		return HttpResponseRedirect('/home/')

	if request.method != 'POST':
		pform = PublicationForm()
		aform = AdvertisementForm()
	else:
		pform = PublicationForm(request.POST)
		aform = AdvertisementForm(request.POST)

		if pform.is_valid() and aform.is_valid():
			saveAdvertisement(aform, pform, request.user)

			return HttpResponseRedirect('/publications/advertisement')

	return render(request, 'publications/advertisement_create.html', {'pform':pform, 'aform':aform})

def AdvertisementDetail(request, advertisementID):
	advertisement = get_object_or_404(Publication, pk=advertisementID).advertisement
	if request.method != 'POST':
		commentForm = CommentForm()
	else:
		commentForm = CommentForm(request.POST)
		if commentForm.is_valid():
			comment = commentForm.save(commit = False)

			comment.publication = Publication.objects.get(pk=advertisement.publication.id)
			comment.author = SDAEUser.objects.get(user = request.user)

			comment.save()

	if not request.user.is_authenticated():
		blockVotes = True
		isAuthor = False
		userVotes = []
	else:
		requestUser = SDAEUser.objects.get(user=request.user)
		userVotes = Vote.objects.filter(author=requestUser, publication=advertisement.publication)
		publicationAuthor = advertisement.publication.author
		isAuthor = (requestUser == advertisement.publication.author)

	blockVotes = False
	if len(userVotes) > 0:
		blockVotes = True

	publicationPoints = len(advertisement.publication.vote_set.filter(isPositive=True)) - len(advertisement.publication.vote_set.filter(isPositive=False))

	context = {
	'advertisement': advertisement,
	'publication': advertisement.publication,
	'publicationPoints': publicationPoints,
	'blockVotes': blockVotes,
	'isAuthor': isAuthor,
	'commentForm': commentForm,
	}

	return render(request, 'publications/advertisement_details.html', context)

	# Edit advertisement
@login_required(login_url='/login/')
def editAdvertisement(request, advertisementID):

	publication = get_object_or_404(Publication, pk=advertisementID)

	if publication.author.user != request.user:
		return HttpResponseForbidden()

	advertisement= publication.advertisement

	if request.method != 'POST':
			pform = PublicationForm(instance=publication)
			aform = AdvertisementForm(instance=advertisement)
	else:
		pform = PublicationForm(request.POST, instance = publication)
		aform = AdvertisementForm(request.POST, instance = advertisement)

		if pform.is_valid() and aform.is_valid():
			saveAdvertisement(aform, pform, request.user)

			return HttpResponseRedirect('/publications/advertisement')

	return render(request, 'publications/advertisement_create.html', {'aform':aform, 'pform':pform})

	#CMaterial List
def Coursematerial(request):
	if request.user.sdaeuser.type.name == 'Empresa':
		return HttpResponseRedirect('/home/')
	coursematerialList = CourseMaterial.objects.all()
	context = {'coursematerialList' : coursematerialList}
	return render(request, 'publications/coursematerial.html', context)

# Create courseMaterial
@login_required(login_url='/login/')
def createCourseMaterial(request):
	if request.user.sdaeuser.type.name!= 'Maestro':
		return HttpResponseRedirect('/home/')
	if request.method != 'POST':
		pform = PublicationForm()
		cmform = CourseMaterialForm()
	else:
		pform = PublicationForm(request.POST)
		cmform =CourseMaterialForm(request.POST)

		if pform.is_valid() and cmform.is_valid():
			saveCourseMaterial(cmform, pform, request.user)

			return HttpResponseRedirect('/publications/material')

	return render(request, 'publications/material_create.html', {'pform':pform, 'cmform':cmform})

def permition(request):
	
	sdaeUser = SDAEUser(user=user, type=UserType.objects.get(name="Alumno"))
	return render(request, 'publications/base.html', {'sdaeUser ':sdaeUser })


def taggit(request):
	tagList = Tag.objects.all()
	context = {'tagList' : tagList}
	return render(request, 'publications/base_publication_detail.html', context)

