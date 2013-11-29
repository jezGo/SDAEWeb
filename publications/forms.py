from django import forms
from django.forms import ModelForm
from django.forms import TextInput, Textarea, FileInput, ClearableFileInput, Select, SelectMultiple, DateTimeInput, SplitDateTimeWidget
from publications.models import Publication, Event, Comment, SDAEUser, Company, UserType, Student
from django.contrib.auth.models import User

# Publication Form
class PublicationForm(forms.ModelForm):
	class Meta:
		model = Publication
		fields = ["title", "content", "imageUrl", "tags"]
		widgets = {
			"title" : TextInput(attrs={"class":"form-control"}),
			"content" : Textarea(attrs={"class":"form-control"}),
			"imageUrl" : FileInput(attrs={"class":"btn"}),
			"tags" : SelectMultiple(attrs={"class":"form-control"}),
		}

# Event Form
class EventForm (forms.ModelForm):
	class Meta:
		model = Event
		fields = ["startDateTime", "endDateTime", "location", "host"]
		widgets = {
			"startDateTime" : DateTimeInput(attrs={"class":"form-control input-append date", "placeholder":"DD/MM/AAAA HH:MM"}),
			"endDateTime" : DateTimeInput(attrs={"class":"form-control", "placeholder":"DD/MM/AAAA HH:MM"}),
			"location" : Select(attrs={"class":"form-control"}),
			"host" : SelectMultiple(attrs={"class":"form-control"}),
		}

# Comment Form
class CommentForm (forms.ModelForm):
	class Meta:
		model = Comment
		fields = ["content"]
		widgets = {
			"content" : Textarea(attrs={"class":"form-control"})
		}

# Company Form
class CompanyForm (forms.ModelForm):
	class Meta:
		model = Company
		fields = ["name", "address", "contactName", "contactPhone", "contactEmail", "website"]

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
		user = super(RegisterForm, self).save(commit=False)

		if commit:
			user.save()

			sdaeUser = SDAEUser(user=user, type=UserType.objects.get(name="Alumno"))
			sdaeUser.save()

			userStudent = Student(sdaeUser = sdaeUser)
			userStudent.save()

			return sdaeUser
		else:
			return None
