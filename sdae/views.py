# Create your views here.

from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404
from publications.models import Publication
from publications.forms import RegisterForm, CompanyForm, UserForm

def home(request):
  highlightedPublications = Publication.objects.all()[:5]

  publications = []

  for publication in highlightedPublications:
  	detailedInfoUrl = '#'

  	if publication.type.name == 'Anuncio':
  		detailedInfoUrl = '/publications/anouncements/' + str(publication.pk)
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

  return render(request, 'sdae/home.html', context)

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
			user = uForm.save()
			company = cForm.save(commit = False)

			company.user = user

			company.save()

			return HttpResponseRedirect("/login/")

	return render(request, 'registration/register_company.html', {'cForm':cForm, 'uForm':uForm})