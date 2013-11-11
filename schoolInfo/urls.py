from django.conf.urls import patterns, url

from schoolInfo import views

urlpatterns = patterns('',
  # url(r'^$', views.schoolInfo, name='publications'),

  # url(r'^events/$', views.events, name='events'),
  # url(r'^events/(?P<eventId>\d+)$', views.eventDetails, name='eventDetails'),

  url(r'^teachers/$', views.teachers, name='teachers'),
  url(r'^teachers/(?P<teacherId>\d+)$', views.teacherDetails, name='teacherDetails'),

  url(r'^schedules/(?P<dayNumber>\d+)$', views.schedules, name='schedules'),

  url(r'^subjects/$', views.subjects, name='subjects'),
)
