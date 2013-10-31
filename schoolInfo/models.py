# coding=UTF-8
from django.db import models
from publications.models import Location

# Create your models here.

# Subject
class Subject(models.Model):
	"""School courses/subjects"""
	name = models.CharField(max_length=100)
	description = models.TextField()
	syllabusUrl = models.FileField(max_length=200, upload_to='subjectsSyllabus/')
	theoryHours = models.IntegerField()
	practicHours = models.IntegerField()
	credits = models.IntegerField()
	#academy = models.ForeignKey(Academy)
	#preRequisites = models.ForeignKey(Subject)
	LEVEL_CHOICES = (
		('1', 'Primer nivel'),
		('2', 'Segundo nivel'),
		('3', 'Tercer nivel'),
		('4', 'Cuarto nivel'),
		('5', 'Quinto nivel'),
		)
	level = models.CharField(max_length=1, choices=LEVEL_CHOICES)
	FORMATION_CHOICES = (
		('I', 'Formación Institucional'),
		('C', 'Formación Científica-Básica'),
		('P', 'Formación Profesional'),
		('T', 'Formación Terminal e Integración'),
		)
	formation = models.CharField(max_length=1, choices=FORMATION_CHOICES)

	def __unicode__(self):
		return self.name

# Teacher
class Teacher(models.Model):
	"""Teachers table"""
	name = models.CharField(max_length=50)
	lastname = models.CharField(max_length=50)
	photoUrl = models.FileField(max_length=200, upload_to='teachersPhotos/')
	about = models.TextField()
	courses = models.ManyToManyField(Subject, through='Course')
	office = models.ForeignKey(Location)
	# Move academies to individual table?
	academy = models.CharField(max_length=100)
	# ?
	website = models.URLField()

	def __unicode__(self):
		return self.name + " " + self.lastname

# Course: Intermediate relation for a MtM relation between Teacher and Subject
#		  which could be reused in the ClassSession model
class Course(models.Model):
	teacher = models.ForeignKey(Teacher)
	subject = models.ForeignKey(Subject)
	scholarCycle = models.CharField(max_length=12)

#ClassSession
class ClassSession(models.Model):
	"""Class session used to represent schedules"""
	# subject = models.ForeignKey(Subject)
	# teacher = models.ForeignKey(Teacher)
	course = models.ForeignKey(Course)
	location = models.ForeignKey(Location)
	# ClassGroups catalog?
	classGroup = models.CharField(max_length=4)
	DAYS_CHOICES = (
		('LU', 'Lunes'),
		('MA', 'Martes'),
		('MI', 'Miércoles'),
		('JU', 'Jueves'),
		('VI', 'Viernes'),
		)
	day = models.CharField(max_length=2, choices=DAYS_CHOICES)
	HOUR_CHOICES = (
		('1M', '07:00 - 08:30'),
		('2M', '08:30 - 10:00'),
		('RM', '10:00 - 10:30'),
		('3M', '10:30 - 12:00'),
		('4M', '12:00 - 13:30'),
		('MV', '13:30 - 15:00'),
		('1V', '15:00 - 16:30'),
		('2V', '16:30 - 18:00'),
		('RV', '18:00 - 18:30'),
		('3V', '18:30 - 20:00'),
		('4V', '20:00 - 21:30'),
		)
	hour = models.CharField(max_length=2, choices=HOUR_CHOICES)