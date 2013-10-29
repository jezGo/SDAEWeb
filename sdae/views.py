# Create your views here.

from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404
from publications.models import Publication

def home(request):
  publicationsList = Publication.objects.all()

  context = {'publicationsList': publicationsList}

  return render(request, 'sdae/home.html', context)
