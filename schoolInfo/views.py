# Create your views here.
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404
from django.shortcuts import render_to_response

from schoolInfo.models import Teacher, Subject, Course, ClassSession
from publications.models import Location, Map
# from schoolInfo.forms import

import json



def schoolInfo(request):
	#return render(request, 'schoolInfo/teachers.html', {'teachersByLastnameDict':teachersByLastnameDict})
	return HttpResponse('schoolInfo')



from string import ascii_uppercase
# Teachers list
def teachers(request):
	if request.user.sdaeuser.type.name == 'Empresa':
		return HttpResponseRedirect('/home/')
	teachersList = Teacher.objects.all()
	alphabet = list(ascii_uppercase)
	teachersByLastnameDict = {}

	for letter in alphabet:
		teachersByLastnameDict.setdefault(letter, [])

	for teacher in teachersList:
		teachersWithLetterList = teachersByLastnameDict.get(teacher.lastname[0].upper())
		teachersWithLetterList.append(teacher)
	
	return render(request, 'schoolInfo/teachers.html', {'teachersByLastnameDict':teachersByLastnameDict})

# Teacher detailed info
from collections import OrderedDict

def teacherDetails(request, teacherId):
	teacher = get_object_or_404(Teacher, pk=teacherId)
	courses = teacher.course_set.all()

	classSessions = []
	sessionsByDay = OrderedDict()
	daysOfWeek = [x[0] for x in ClassSession.DAYS_CHOICES]
	# daysOfWeek = [x[1] for x in ClassSession.DAYS_CHOICES]

	# init sessionsDict with empty list
	for day in daysOfWeek:
		sessionsByDay.setdefault(day, [])

	for course in courses:
		classSessions += course.classsession_set.all()

	for classSession in classSessions:
		daySessionsList = sessionsByDay.get(classSession.day)
		# daySessionsList = sessionsByDay.get(classSession.get_day_display())
		daySessionsList.append(classSession)

	return render(request, 'schoolInfo/teacher_detail.html', {'teacher':teacher, 'sessionsByDay':sessionsByDay})

# Schedules view
from datetime import datetime

# Schedules subcat page
def schedules(request):
	if request.user.sdaeuser.type.name == 'Empresa':
		return HttpResponseRedirect('/home/')
	
	subject = Subject.objects.all()
	
	return render(request,'schoolInfo/days.html',{'subject':subject})

# Schedule of the day
def daySchedule(request, dayNumber):
	if int(dayNumber) < 1 or int(dayNumber) > 5:
		return HttpResponse(dayNumber + ' is an invalid day number')

	days = [x[0] for x in ClassSession.DAYS_CHOICES]

	# day = days[datetime.today().isoweekday()-1]
	day = days[int(dayNumber)-1]
	dayName = ClassSession.DAYS_CHOICES[int(dayNumber)-1][1]
	classesByHour = OrderedDict()
	hours = [x[1] for x in ClassSession.HOUR_CHOICES]

	for hour in hours:
		classesByHour.setdefault(hour, [])

	dayClasses = ClassSession.objects.filter(day=day)

	for dayClass in dayClasses:
		hourClassesList = classesByHour.get(dayClass.get_hour_display())
		hourClassesList.append(dayClass)

	return render(request, 'schoolInfo/schedules.html', {'classesByHour':classesByHour, 'dayName':dayName})

# Subjects view
def subjects(request):
	if request.user.sdaeuser.type.name == 'Empresa':
		return HttpResponseRedirect('/home/')
	subjectList = Subject.objects.all()
	alphabet = list(ascii_uppercase)
	subjectByLastnameDict = {}

	for letter in alphabet:
		subjectByLastnameDict.setdefault(letter, [])

	for subject in subjectList:
		subjectWithLetterList = subjectByLastnameDict.get(subject.name[0].upper())
		subjectWithLetterList.append(subject)

	return render(request, 'schoolInfo/subjects.html', {'subjectByLastnameDict':subjectByLastnameDict})

# SUbject detailed info
from collections import OrderedDict

def subjectsDetails(request, subjectsId):
	subject = get_object_or_404(Subject, pk=subjectsId)
	

	return render(request, 'schoolInfo/subject_detail.html', {'subject':subject})



# Locations
def locations(request):
	if request.user.sdaeuser.type.name == 'Empresa':
		return HttpResponseRedirect('/home/')
	locations = Location.objects.filter(map=Map.objects.get(name='ESCOM Piso 1'))
	
	locsDict = {}
	for l in locations:
		locsDict[l.id] = {'id':l.id, 'name':l.name, 'x1':l.mapX1, 'x2':l.mapX2,  'y1':l.mapY1, 'y2':l.mapY2}
		
		if l.id == 119:
			response = "<h1>" + l.name + "</h1> <br/><h3>imagen: </h3><div>"
		context = {  "locations":json.dumps(locsDict)}
	return render(request, 'schoolInfo/locations.html', context)

	
		
# Locations
def locationsA(request):

	locationsb =  Location.objects.filter(map=Map.objects.get(name='ESCOM Piso 2'))
	locsDict = {}
	for l in locationsb:
			locsDict[l.id] = {'id':l.id, 'name':l.name, 'x1':l.mapX1, 'x2':l.mapX2,  'y1':l.mapY1, 'y2':l.mapY2}
	context = {"locationsb":json.dumps(locsDict)}		

	return render(request, 'schoolInfo/locationsA.html', context)

# Locations
def locationsB(request):
	locationsc =  Location.objects.filter(map=Map.objects.get(name='ESCOM Planta Baja'))
	locsDict = {}
	for l in locationsc:
			locsDict[l.id] = {'id':l.id, 'name':l.name, 'x1':l.mapX1, 'x2':l.mapX2,  'y1':l.mapY1, 'y2':l.mapY2}
	context = {"locationsc":json.dumps(locsDict)}		

	return render(request, 'schoolInfo/locationsB.html', context)

# Location Detail
def locationDetail(request, locationId):
	location = get_object_or_404(Location, pk=locationId)

	eventsList = location.event_set.all()
	responseStr = "<h1>" + location.name + "</h1> <br/><h3>Eventos: </h3><div>"

			
	# for event in eventsList:
	# 	responseStr += "<p>" + event.publication.title + "</p>"

	# responseStr += "</div>"

	return render(request, 'schoolInfo/location_detail.html', {'location' : location, 'eventsList': eventsList})
	# return HttpResponse(responseStr)

# Location Detail
def locationsO(request):
	loc ="<h1>location"

	
	return render(request, 'schoolInfo/office.html', {'loc' : loc})
	# return HttpResponse(responseStr)	

# School activity
def activities(request):
	return HttpResponse('school activities')
