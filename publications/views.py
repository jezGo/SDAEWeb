# Create your views here.

from django.http import HttpResponse, HttpResponseRedirect, HttpResponseForbidden
from django.shortcuts import render, get_object_or_404
from publications.models import Publication, Event, PublicationType, SDAEUser, Vote
from publications.forms import PublicationForm, EventForm, CommentForm
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

# Publications List
def publications(request):
  publicationsList = Publication.objects.all()

  context = {'publicationsList': publicationsList}

  return render(request, 'publications/publications.html', context)

# Create Publication
@login_required(login_url='/login/')
def createPublication(request):
	if request.method != 'POST':
		form = PublicationForm()
	else:
		form = PublicationForm(request.POST)
		if form.is_valid():
			return HttpResponseRedirect('/publications/')

	return render(request, 'publications/publications_create.html', {'form': form})

# Events List
def events(request):
	eventsList = Event.objects.all()

	publicationPointsList = {}

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

	requestUser = SDAEUser.objects.get(user=request.user)
	userVotes = Vote.objects.filter(author=requestUser, publication=event.publication)
	publicationAuthor = event.publication.author
	isAuthor = (requestUser == event.publication.author)

	blockVotes = False
	if len(userVotes) > 0:
		blockVotes = True

	publicationPoints = len(event.publication.vote_set.filter(isPositive=True)) - len(event.publication.vote_set.filter(isPositive=False))

	context = {
	'event':event,
	'commentForm':commentForm,
	'publicationPoints': publicationPoints,
	'blockVotes':blockVotes,
	'isAuthor':isAuthor
	}

	return render(request, 'publications/event_details.html', context)

# Vote event
@login_required(login_url='/login/')
def votePublication(request):
	if request.method != 'POST':
		return HttpResponseRedirect("/")

	publicationId = request.POST['publicationId']
	publication = get_object_or_404(Publication, pk=publicationId)

	isPositive = True

	if (request.POST["voteValue"] == "-1"):
		isPositive = False

	vote = Vote(publication=publication, author=SDAEUser.objects.get(user=request.user), isPositive=True)
	vote.save()

	return HttpResponseRedirect("/publications/events/" + publicationId)

# Save Event
def saveEvent(eform, pform, user):
	publication = pform.save(commit = False)

	publicationAuthor = SDAEUser.objects.get(user=user)
	publicationType = PublicationType.objects.get(name='Evento')
	publication.type = publicationType
	publication.author = publicationAuthor
	publication.save()

	event = eform.save(commit = False)

	event.publication = publication
	event.save()

	eform.save_m2m()

# Create Event
@login_required(login_url='/login/')
def createEvent(request):
	if request.method != 'POST':
		pform = PublicationForm()
		eform = EventForm()
	else:
		pform = PublicationForm(request.POST)
		eform = EventForm(request.POST)

		if pform.is_valid() and eform.is_valid():
			saveEvent(eform, pform, request.user)

			return HttpResponseRedirect('/publications/events')

	return render(request, 'publications/events_create.html', {'pform':pform, 'eform':eform})

# Edit event
@login_required(login_url='/login/')
def editEvent(request, eventId):
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

# Delete Event
@login_required(login_url='/login/')
def deleteEvent(request):
	if request.method != 'POST':
		return HttpResponseRedirect('/publications/events/')
	else:
		return HttpResponse("delete event: " + request.POST['publicationId']);
