from django.conf.urls import patterns, url

from schoolInfo import views

urlpatterns = patterns('',
  # url(r'^$', views.schoolInfo, name='publications'),

  # url(r'^events/$', views.events, name='events'),
  # url(r'^events/(?P<eventId>\d+)$', views.eventDetails, name='eventDetails'),

  url(r'^$', views.schoolInfo, name='schoolInfo'),
  url(r'^teachers/$', views.teachers, name='teachers'),
  url(r'^teachers/(?P<teacherId>\d+)$', views.teacherDetails, name='teacherDetails'),

  url(r'^schedules/$', views.schedules, name='schedules'),
  url(r'^schedules/(?P<dayNumber>\d+)$', views.daySchedule, name='daySchedule'),

  url(r'^subjects/$', views.subjects, name='subjects'),

  url(r'^locations/$', views.locations, name='locations'),
  url(r'^locations/(?P<locationId>\d+)$', views.locationDetail, name='locationDetails'),

  url(r'^activities/$', views.activities, name='activities'),
)
