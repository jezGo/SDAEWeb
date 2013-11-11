# Create your views here.
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404

from schoolInfo.models import Teacher
# from schoolInfo.forms import

# Teachers list
def teachers(request):
	teachersList = Teacher.objects.all()
	teachersList.extra(order_by=["-lastname"])
	return HttpResponse("teachers")

# Teacher detailed info
def teacherDetails(request, teacherId):
	return HttpResponse("teacher " + teacherId)