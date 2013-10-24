from django.conf.urls import patterns, url

from publications import views

urlpatterns = patterns('',
  url(r'^$', views.publications, name='publications'),	
  url(r'^create/$', views.createPublication, name='createPublication'),
  url(r'^events/$', views.events, name='events'),
  url(r'^events/create/$', views.createEvent, name='createEvent'),
)
