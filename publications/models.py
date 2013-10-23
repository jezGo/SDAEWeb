from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class SDAEUser(models.Model):
  """User of the app. Integrates with the Django Users Model"""
  user = models.OneToOneField(User)
  studentId = models.CharField(max_length=10, blank=True)
  profileImageUrl = models.CharField(max_length=200, blank=True)
  
  def __unicode__(self):
    user = User.objects.get(pk=self.id)
    return user.first_name + user.last_name

class Tag(models.Model):
  """Tags for publications"""
  name = models.CharField(max_length=100)

  def __unicode__(self):
    return self.name

class PublicationType(models.Model):
  """Publication Type table"""
  name = models.CharField(max_length=50)

  def __unicode__(self):
    return self.name

class Publication(models.Model):
  """Publications table. Used as header for all types of publications"""
  title = models.CharField(max_length=100)
  content = models.TextField()
  type = models.ForeignKey(PublicationType)
  published = models.DateTimeField(auto_now_add=True)
  lastEdited = models.DateTimeField(auto_now=True)
  imageUrl = models.FileField(max_length=200, upload_to='publications/', blank=True)
  author = models.ForeignKey(SDAEUser)
  tags = models.ManyToManyField(Tag, blank=True)

  def __unicode__(self):
    return self.title
