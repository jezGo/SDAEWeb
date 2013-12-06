#coding: utf-8

from django.db import models
from django.contrib.auth.models import User

# UserType
class UserType(models.Model):
  """User types catalog."""
  name = models.CharField(max_length="20", verbose_name="nombre")

  def __unicode__(self):
    return self.name

# SDAEUSER
class SDAEUser(models.Model):
  """General user of the app. Integrates with the Django Users Model"""
  user = models.OneToOneField(User, verbose_name="usuario")
  type = models.ForeignKey(UserType, verbose_name="tipo")
  profileImageUrl = models.CharField(max_length=200, blank=True, null=True, verbose_name="imagen de perfil")
  # TODO: Replace bellow fields for a auth services table and detail table.
  # TODO: Search a social integration plugin
  facebookUsername = models.CharField(max_length=80, blank=True, null=True, verbose_name="usuario de facebook")
  facebookAuthToken = models.CharField(max_length=100, blank=True, null=True, verbose_name="token de facebook")
  twitterUsername = models.CharField(max_length=20, blank=True, null=True, verbose_name="usuario de twitter")
  twitterAuthToken = models.CharField(max_length=100, blank=True, null=True, verbose_name="token de twitter")

  def __unicode__(self):
    return self.user.username

  class Meta:
    verbose_name = "Usuario SDAE"
    verbose_name_plural = "Usuarios SDAE"

# Student
class Student(models.Model):
  """Table for user type Student"""
  sdaeUser = models.OneToOneField(SDAEUser)
  studentId = models.CharField(max_length=10, verbose_name="boleta", blank=True, null=True)
  startDate = models.DateField(blank=True, null=True)
  endDate = models.DateField(blank=True, null=True)

  def __unicode__(self):
    return self.sdaeUser.user.username

  class Meta:
    verbose_name = "Alumno"
    verbose_name_plural = "Alumnos"

# Teacher
class UserTeacher(models.Model):
  """Table for user type teacher"""
  sdaeUser = models.OneToOneField(SDAEUser)
  teacher = models.OneToOneField("schoolInfo.Teacher")
  teacherId = models.CharField(max_length=10, verbose_name="boleta", blank=True, null=True)

  def __unicode__(self):
    return self.teacher

# School Department
class SchoolDepartment(models.Model):
  name = models.CharField(max_length=60, verbose_name="nombre")
  manager = models.CharField(max_length=60, verbose_name="encargado")
  description = models.TextField(blank=True, null=True, verbose_name="descripción")
  serviceHours = models.CharField(max_length=80, blank=True, null=True, verbose_name="horario de servicio")
  sdaeUser = models.OneToOneField(SDAEUser)

  def __unicode__(self):
    return self.name

# Students Club
class StudentsClub(models.Model):
  name = models.CharField(max_length=60, verbose_name="nombre")
  teacherManager = models.CharField(max_length=60, verbose_name="profesor encargado")
  studentManager = models.CharField(max_length=60, verbose_name="alumno representante")
  description = models.TextField(blank=True, null=True, verbose_name="descripción")
  website = models.CharField(max_length=100, verbose_name="sitio web")
  sdaeUser = models.OneToOneField(SDAEUser)

  def __unicode__(self):
    return self.name

# Company
class Company(models.Model):
  """Company who will post job offers"""
  sdaeUser = models.OneToOneField(SDAEUser)
  name = models.CharField(max_length=80)
  address = models.CharField(max_length=200, blank=True)
  contactName = models.CharField(max_length=100)
  contactPhone = models.CharField(max_length=15, blank=True)
  contactEmail = models.EmailField(blank=True)
  website = models.URLField(blank=True)

  def __unicode__(self):
    return self.name

# Tag
class Tag(models.Model):
  """Tags for publications"""
  name = models.CharField(max_length=100, verbose_name="nombre")

  def __unicode__(self):
    return self.name

# PublicationType
class PublicationType(models.Model):
  """Publication Type table"""
  name = models.CharField(max_length=50)

  def __unicode__(self):
    return self.name

  class Meta:
    verbose_name = "Tipo de Publicación"
    verbose_name_plural = "Tipos de Publicaciones"

# Publication
class Publication(models.Model):
  """Publications table. Used as header for all types of publications"""
  title = models.CharField(max_length=100, verbose_name="Título")
  content = models.TextField(verbose_name="Contenido")
  type = models.ForeignKey(PublicationType, verbose_name="Tipo")
  published = models.DateTimeField(auto_now_add=True, verbose_name="Publicado")
  lastEdited = models.DateTimeField(auto_now=True, verbose_name="Última Edición")
  imageUrl = models.FileField(max_length=200, upload_to='publications/', blank=True, verbose_name="Imagen")
  author = models.ForeignKey(SDAEUser, verbose_name="Autor")
  tags = models.ManyToManyField(Tag, blank=True, verbose_name="Etiquetas")
  hightlighted = models.BooleanField(default=False)

  def __unicode__(self):
    return self.title

  class Meta:
    verbose_name = "Publicación"
    verbose_name_plural = "Publicaciones"

# Comment
class Comment(models.Model):
  """Comments table"""
  publication = models.ForeignKey(Publication)
  content = models.TextField(verbose_name="Comentario", blank=False, null=False)
  published = models.DateTimeField(auto_now_add=True)
  lastEdited = models.DateTimeField(auto_now=True)
  author = models.ForeignKey(SDAEUser)

  def __unicode__(self):
    return "Comentario: " + self.content

# Vote
class Vote(models.Model):
  """Votes table"""
  publication = models.ForeignKey(Publication)
  author = models.ForeignKey(SDAEUser)
  isPositive = models.BooleanField()
  givenDateTime = models.DateTimeField(auto_now_add=True)
  modifiedDateTime = models.DateTimeField(auto_now=True)

  def __unicode__(self):
    value = -1
    if (self.isPositive):
      value = +1
    return "Voto: " + str(value) + " a " + self.publication.title

# Map
class Map(models.Model):
  """Maps table"""
  id = models.AutoField(primary_key=True)
  name = models.CharField(max_length=100)
  imageUrl = models.FileField(max_length=200, upload_to='maps/', blank=True)

  def __unicode__(self):
    return self.name

# LocationType
class LocationType(models.Model):
  """Locations Types table"""
  name = models.CharField(max_length=50)

  def __unicode__(self):
    return self.name

# Location
class Location(models.Model):
  """Locations table"""
  name = models.CharField(max_length=100)
  type = models.ForeignKey(LocationType)
  map = models.ForeignKey(Map, blank=True)
  mapX1 = models.IntegerField(blank=True, null=True)
  mapX2 = models.IntegerField(blank=True, null=True)
  mapY1 = models.IntegerField(blank=True, null=True)
  mapY2 = models.IntegerField(blank=True, null=True)

  def __unicode__(self):
    return self.name

# School Material
class CourseMaterial(models.Model):
 """Publication from administrative school departments"""
 publication = models.OneToOneField(Publication)
 attachment = models.FileField(max_length=400, upload_to='publications/', verbose_name="Archivo")

 def __unicode__(self):
    return self.publication.title

# CourseMaterial
# class CourseMaterial(models.Model):
#   """Document related to a course"""
#   publication = models.OneToOneField(Publication)
#   attachment = models.FileField(max_length=200, upload_to='classMaterial/')
#   group = models.ManyToManyField(django.contrib.auth.Group)

# Event
class Event(models.Model):
  """Events table"""
  publication = models.OneToOneField(Publication, verbose_name="Publicación")
  startDateTime = models.DateTimeField(verbose_name="Inicia")
  endDateTime = models.DateTimeField(verbose_name="Termina")
  location = models.ForeignKey(Location, verbose_name="Lugar")
  host = models.ManyToManyField(SDAEUser, verbose_name="Organizadores")
  parentEvent = models.ForeignKey('Event', blank=True, null=True, verbose_name="Evento Principal")
  speaker = models.CharField(max_length=100, blank=True, null=True)
  #attendants = models.ManyToManyField(SDAEUser)

  def __unicode__(self):
    return self.publication.title

# EventActivity
# class EventActivity(models.Model):
#   """EventActivities Table"""
#   publication = models.OneToOneField(Publication)
#   event = models.ForeignKey(Event)
#   speaker = models.CharField(max_length=100, blank=True)
#   startDateTime = models.DateTimeField()
#   endDateTime = models.DateTimeField()
#   location = models.ForeignKey(Location)
  #attendants = models.ManyToManyField(SDAEUser)

  # def __unicode__(self):
  #   return self.publication.title

# JobType
class JobType(models.Model):
  """Jobs Types table"""
  name = models.CharField(max_length=50)
  # Full time, Part time, Project, Social Service, Internship

  def __unicode__(self):
    return self.name

# JobOffer
class JobOffer(models.Model):
  """JobOffers table"""
  publication = models.OneToOneField(Publication)
  company = models.ForeignKey(Company)
  appointmentDate = models.CharField(max_length=60, blank=True)
  appointmentAdress = models.CharField(max_length=200, blank=True)
  laboralAddress = models.CharField(max_length=200, blank=True)
  compensation = models.CharField(max_length=20, blank=True)
  isOpen = models.BooleanField(default=True)

  def __unicode__(self):
    return self.publiation.title

# BuySell
class BuySell(models.Model):
  """BuySell table"""
  publication = models.OneToOneField(Publication)
  isSell = models.BooleanField() # True if is a selling item, false if is a buy offer
  isNew = models.BooleanField()
  price = models.DecimalField(blank=True, max_digits=7, decimal_places=2)
  specsUrl = models.URLField(blank=True)
  isAvailable = models.BooleanField(default=True)

  def __unicode__(self):
    return self.publication.title

# LostAndFound
class LostAndFound(models.Model):
  """Lost and found table"""
  publication = models.OneToOneField(Publication)
  isLostType = models.BooleanField(verbose_name="¿Es objeto perdido?") # True if is a lost item, false if is found
  lostOrFoundDate = models.DateField(blank=True, verbose_name="Fecha de extravío")
  lostOrFoundTime = models.TimeField(blank=True, verbose_name="Hora de extravío")
  lastSeenLocation = models.ForeignKey(Location, blank=True, null=True, verbose_name="Última localización donde se vio")
  reward = models.DecimalField(blank=True, max_digits=7, decimal_places=2, verbose_name="Recompenza")
  isActive = models.BooleanField(default=True)

  def __unicode__(self):
    return self.publication.title

#   advertisement

class Advertisement(models.Model):
  """ advertisement table"""
  publication = models.OneToOneField(Publication)
  EffectiveDate = models.DateField(blank=True, verbose_name="Vigencia") # True if is a lost item, false if is found
  directedTo = models.CharField(blank=True, null=True, max_length=60, verbose_name="Dirigido a")
  isActive = models.BooleanField(default=True, verbose_name="¿Está Activo?")

  def __unicode__(self):
    return self.publication.title