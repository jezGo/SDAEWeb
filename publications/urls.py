from django.conf.urls import patterns, url

from publications import views

urlpatterns = patterns('',
  url(r'^$', views.publications, name='publications'),	
  url(r'^create/$', views.createPublication, name='createPublication'),
  # url(r'^vote/(?P<publicationId>\d+)$', views.votePublication, name='votePublication'),
  url(r'^vote/$', views.votePublication, name='votePublication'),
  url(r'^events/$', views.events, name='events'),
  url(r'^events/create/$', views.createEvent, name='createEvent'),
  url(r'^events/(?P<eventId>\d+)$', views.eventDetails, name='eventDetails'),
  url(r'^events/edit/(?P<eventId>\d+)$', views.editEvent, name='editEvent'),
  # url(r'^events/delete/$', views.deleteEvent, name='deleteEvent'),

)
