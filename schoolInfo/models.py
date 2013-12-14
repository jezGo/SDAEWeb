# coding=UTF-8
from django.db import models
from publications.models import Location

# Create your models here.

# Subject
class Subject(models.Model):
	"""School courses/subjects"""
	name = models.CharField(max_length=100)
	description = models.TextField(blank=True, null=True)
	syllabusUrl = models.FileField(max_length=200, upload_to='subjectsSyllabus/', blank=True, null=True)
	theoryHours = models.DecimalField(max_digits=4, decimal_places=2, blank=True, null=True)
	practicHours = models.DecimalField(max_digits=4, decimal_places=2, blank=True, null=True)
	credits = models.DecimalField(max_digits=4, decimal_places=2, blank=True, null=True)
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
	photoUrl = models.FileField(max_length=200, upload_to='teachersPhotos/', blank=True, null=True)
	about = models.TextField(blank=True, null=True)
	courses = models.ManyToManyField(Subject, through='Course')
	office = models.ForeignKey(Location, blank=True, null=True)
	# Move departments and academies to individual table?
	ACADEMIC_DEPARTMENT_CHOICES = (
		('DFB', 'Departamento de Formación Básica'),
		('DISC', 'Departamento de Ingeniería en Sistemas Computacionales'),
		('DCIC', 'Departamento de Ciencias e Ingeniería de la Computación'),
		('DFII', 'Departamento de Formación Integral e Institucional'),
		)
	department = models.CharField(max_length=4, choices=ACADEMIC_DEPARTMENT_CHOICES, blank=True, null=True)
	academy = models.CharField(max_length=100, blank=True, null=True)
	# ?
	website = models.URLField(blank=True, null=True)

	def __unicode__(self):
		return self.name + " " + self.lastname

# Group
class Group(models.Model):
	name = models.CharField(max_length=4)
	
	def __unicode__(self):
		return self.name

# Course: Intermediate relation for a MtM relation between Teacher and Subject
#		  which could be reused in the ClassSession model
class Course(models.Model):
	teacher = models.ForeignKey(Teacher)
	subject = models.ForeignKey(Subject)
	scholarCycle = models.CharField(max_length=12)
	group = models.ForeignKey(Group)

	def __unicode__(self):
		return self.subject.name + " con " + self.teacher.name + " " + self.teacher.lastname + " en " + str(self.scholarCycle)

# ClassSession
class ClassSession(models.Model):
	"""Class session used to represent schedules"""
	# subject = models.ForeignKey(Subject)
	# teacher = models.ForeignKey(Teacher)
	course = models.ForeignKey(Course)
	location = models.ForeignKey(Location)
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

	def __unicode__(self):
		return self.course.subject.name + " el " + self.get_day_display() + " a las " + self.get_hour_display()