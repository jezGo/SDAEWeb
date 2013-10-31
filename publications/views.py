# Create your views here.

from django.http import HttpResponse, HttpResponseRedirect
from django.http import Http404
from django.shortcuts import render, get_object_or_404
from publications.models import Publication, Event, PublicationType, SDAEUser
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

	context = {'eventsList' : eventsList}

	return render(request, 'publications/events.html', context)

# Event details
def eventDetails(request, eventId):
	event = get_object_or_404(Event, pk=eventId)

	if request.method != 'POST':
		commentForm = CommentForm()
	else:
		commentForm = CommentForm(request.POST)
		if commentForm.is_valid():
			comment = commentForm.save(commit = False)

			comment.publication = Publication.objects.get(pk=eventId)
			comment.author = SDAEUser.objects.get(user = request.user)

			comment.save()

	context = {'event':event, 'commentForm':commentForm}

	return render(request, 'publications/event_details.html', context)

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
			#
			publication = pform.save(commit = False)

			# TODO: Get AuthorUser from session
			publicationAuthor = SDAEUser.objects.get(user=User.objects.get(username='mkfnx'))
			publicationType = PublicationType.objects.get(name='Evento')
			publication.type = publicationType
			publication.author = publicationAuthor
			publication.save()

			#
			event = eform.save(commit = False)

			event.publication = publication
			event.save()

			return HttpResponseRedirect('/publications/events')

	return render(request, 'publications/events_create.html', {'pform':pform, 'eform':eform})
	