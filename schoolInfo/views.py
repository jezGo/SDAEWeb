# Create your views here.
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404

from schoolInfo.models import Teacher, Subject, Course, ClassSession
from publications.models import Location
# from schoolInfo.forms import

from string import ascii_uppercase
# Teachers list
def teachers(request):
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

def schedules(request, dayNumber):
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
	return HttpResponse('subjects')

# Locations
def locations(request):
	return render(request, 'schoolInfo/locations.html')

# Location Detail
def locationDetail(request, locationId):
	location = get_object_or_404(Location, pk=locationId)

	eventsList = location.event_set.all()
	responseStr = "<h1>" + location.name + "</h1> <br/><h3>Eventos: </h3><div>"

	# for event in eventsList:
	# 	responseStr += "<p>" + event.publication.title + "</p>"

	# responseStr += "</div>"

	return render(request, 'schoolInfo/location_detail.html', {'eventsList': eventsList})
	# return HttpResponse(responseStr)