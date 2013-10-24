from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class SDAEUser(models.Model):
  """User of the app. Integrates with the Django Users Model"""
  user = models.OneToOneField(User)
  studentId = models.CharField(max_length=10, blank=True)
  profileImageUrl = models.CharField(max_length=200, blank=True)
  
  def __unicode__(self):
    return self.user.username

# Tag
class Tag(models.Model):
  """Tags for publications"""
  name = models.CharField(max_length=100)

  def __unicode__(self):
    return self.name

# PublicationType
class PublicationType(models.Model):
  """Publication Type table"""
  name = models.CharField(max_length=50)

  def __unicode__(self):
    return self.name

# Publication
class Publication(models.Model):
  """Publications table. Used as header for all types of publications"""
  title = models.CharField(max_length=100)
  content = models.TextField()
  type = models.ForeignKey(PublicationType)
  published = models.DateTimeField(auto_now_add=True)
  lastEdited = models.DateTimeField(auto_now=True)
  imageUrl = models.FileField(max_length=200, upload_to='publications/', blank=True)
  author = models.ForeignKey(SDAEUser)
  # author = models.OneToOneField(SDAEUser)
  tags = models.ManyToManyField(Tag, blank=True)

  def __unicode__(self):
    return self.title

# Comment
class Comment(models.Model):
  """Comments table"""
  publication = models.ForeignKey(Publication)
  content = models.TextField()
  published = models.DateTimeField(auto_now_add=True)
  lastEdited = models.DateTimeField(auto_now=True)
  author = models.OneToOneField(SDAEUser)

  def __unicode__(self):
    return "Comentario: " + sef.content[20:]

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
    return "Voto: " + value + "a " + publication.title

# Map
class Map(models.Model):
  """Maps table"""
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
  mapX = models.IntegerField(blank=True)
  mapY = models.IntegerField(blank=True)

  def __unicode__(self):
    return self.name

# Event
class Event(models.Model):
  """Events table"""
  publication = models.OneToOneField(Publication)
  startDateTime = models.DateTimeField()
  endDateTime = models.DateTimeField()
  location = models.ForeignKey(Location)
  host = models.ManyToManyField(SDAEUser)

  def __unicode__(self):
    return self.publication.title

# EventActivity
class EventActivity(models.Model):
  """EventActivities Table"""
  publication = models.OneToOneField(Publication)
  event = models.ForeignKey(Event)
  speaker = models.CharField(max_length=100, blank=True)
  startDateTime = models.DateTimeField()
  endDateTime = models.DateTimeField()
  location = models.ForeignKey(Location)
  #attendants = models.ManyToManyField(SDAEUser)

  def __unicode__(self):
    return self.publication.title

# JobType
class JobType(models.Model):
  """Jobs Types table"""
  name = models.CharField(max_length=50)
  # Full time, Part time, Project, Social Service, Internship

# Company
class Company(models.Model):
  """Company who will post job offers"""
  name = models.CharField(max_length=80)
  address = models.CharField(max_length=200, blank=True)
  contactName = models.CharField(max_length=100)
  contactPhone = models.CharField(max_length=15, blank=True)
  contactEmail = models.EmailField(blank=True)
  website = models.URLField(blank=True)
  user = models.OneToOneField(SDAEUser, blank=True, null=True)

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
  isLostType = models.BooleanField() # True if is a lost item, false if is found
  lostOrFoundDate = models.DateField(blank=True)
  lostOrFoundTime = models.TimeField(blank=True)
  lastSeenLocation = models.ForeignKey(Location, blank=True, null=True)
  reward = models.DecimalField(blank=True, max_digits=7, decimal_places=2)
  isActive = models.BooleanField(default=True)

  def __unicode__(self):
    return self.publication.title
