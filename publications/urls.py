from django.conf.urls import patterns, url

from publications import views

urlpatterns = patterns('',
  url(r'^$', views.publications, name='publications'),
)
