from django import forms
from django.forms import ModelForm
from publications.models import Publication, Event, Comment

class PublicationForm(forms.ModelForm):
	class Meta:
		model = Publication
		fields = ["title", "content", "imageUrl", "tags"]


class EventForm (forms.ModelForm):
	class Meta:
		model = Event
		fields = ["startDateTime", "endDateTime", "location", "host"]

class CommentForm (forms.ModelForm):
	class Meta:
		model = Comment
		fields = ["content"]
