from django.conf.urls import patterns, url

from publications import views

urlpatterns = patterns('',
  # Publications List
  url(r'^$', views.publications, name='publications'),

  # General publication actions
  # url(r'^create/$', views.createPublication, name='createPublication'),
  url(r'^vote/$', views.votePublication, name='votePublication'),
  url(r'^delete/$', views.deletePublication, name='deletePublication'),

  # Announcements actions
  # url(r'^announcements/$', views.announcements, name='announcements'),
  # url(r'^announcements/create/$', views.createAnnouncement, name='createAnnouncement'),
  # url(r'^announcements/(?P<publicationId>\d+)$', views.announcementDetails, name='announcementDetails'),
  # url(r'^announcements/edit/(?P<publicationId>\d+)$', views.editAnnouncement, name='editAnnouncement'),

  # Class material actions
  # url(r'^classmaterial/$', views.classMaterial, name='classMaterial'),
  # url(r'^classmaterial/create/$', views.createClassMaterial, name='createClassMaterial'),
  # url(r'^classmaterial/(?P<publicationId>\d+)$', views.classMaterialDetails, name='classMaterialDetails'),
  # url(r'^classmaterial/edit/(?P<publicationId>\d+)$', views.editClassMaterial, name='editClassMaterial'),

  # Event actions
  url(r'^events/$', views.events, name='events'),
  url(r'^events/create/$', views.createEvent, name='createEvent'),
  url(r'^events/(?P<publicationId>\d+)$', views.eventDetails, name='eventDetails'),
  url(r'^events/edit/(?P<publicationId>\d+)$', views.editEvent, name='editEvent'),

  # Job Offer actions
  # url(r'^joboffers/$', views.joboffers, name='joboffers'),
  # url(r'^joboffers/create/$', views.createJobOffer, name='createJobOffer'),
  # url(r'^joboffers/(?P<publicationId>\d+)$', views.jobOfferDetails, name='jobOfferDetails'),
  # url(r'^joboffers/edit/(?P<publicationId>\d+)$', views.editJobOffer, name='editJobOffer'),

  # Lost and Found Actions
  # url(r'^lostandfound/$', views.lostAndFound, name='lostAndFound'),
  # url(r'^lostandfound/create/$', views.createLostAndFound, name='createLostAndFound'),
  # url(r'^lostandfound/(?P<publicationId>\d+)$', views.lostAndFoundDetails, name='lostAndFoundDetails'),
  # url(r'^lostandfound/edit/(?P<publicationId>\d+)$', views.editLostAndFound, name='editLostAndFound'),
  
  # Buy and Sell Actions
  # url(r'^buyandsell/$', views.buyandsell, name='buyandsell'),
  # url(r'^buyandsell/create/$', views.createBuyAndSell, name='createBuyAndSell'),
  # url(r'^buyandsell/(?P<publicationId>\d+)$', views.buyAndSellDetails, name='buyAndSellDetails'),
  # url(r'^buyandsell/edit/(?P<publicationId>\d+)$', views.editBuyAndSell, name='editBuyAndSell'),
)
