from django import forms
from django.forms import ModelForm
from publications.models import Publication, Event, Comment, SDAEUser, Company
from django.contrib.auth.models import User

# Publication Form
class PublicationForm(forms.ModelForm):
	class Meta:
		model = Publication
		fields = ["title", "content", "imageUrl", "tags"]

# Event Form
class EventForm (forms.ModelForm):
	class Meta:
		model = Event
		fields = ["startDateTime", "endDateTime", "location", "host"]

# Comment Form
class CommentForm (forms.ModelForm):
	class Meta:
		model = Comment
		fields = ["content"]

# Company Form
class CompanyForm (forms.ModelForm):
	class Meta:
		model = Company
		fields = ["name", "address", "contactName", "contactPhone", "contactEmail", "website"]


# Register Form
from django.contrib.auth.forms import UserCreationForm
# from django.contrib.auth.models import User
from django import forms

# User Form
class UserForm(UserCreationForm):
	class Meta:
		model = User
		fields = ["username", "email"]

class RegisterForm(UserCreationForm):
	class Meta:
		model = User
		fields = ["username", "email", "first_name", "last_name"]

	def save(self, commit=True):
		theUser = super(RegisterForm, self).save(commit=False)

		if commit:
			theUser.save()
			sdaeUser = SDAEUser(user=theUser)
			sdaeUser.save()

			return sdaeUser
		else:
			return None
