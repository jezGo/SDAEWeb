from django.conf.urls import patterns, url

from publications import views

urlpatterns = patterns('',
  # Publications List
  url(r'^$', views.publications, name='publications'),

  # General publication actions
  # url(r'^create/$', views.createPublication, name='createPublication'),
  url(r'^vote/$', views.votePublication, name='votePublication'),
  url(r'^delete/$', views.deletePublication, name='deletePublication'),
  url(r'^tag/$', views.createTag, name='createTag'),

  # Announcements actions
url(r'^advertisement/$', views.advertisement, name='advertisement'),
url(r'^advertisement/create/$', views.createAdvertisement, name='createAdvertisement'),
url(r'^advertisement/(?P<advertisementID>\d+)$', views.AdvertisementDetail, name='AdvertisementDetail'),
url(r'^advertisement/edit/(?P<advertisementID>\d+)$', views.editAdvertisement, name='editAdvertisement'),

  # Class material actions
  # url(r'^classmaterial/$', views.classMaterial, name='classMaterial'),
  # url(r'^classmaterial/create/$', views.createClassMaterial, name='createClassMaterial'),
  # url(r'^classmaterial/(?P<publicationId>\d+)$', views.classMaterialDetails, name='classMaterialDetails'),
  # url(r'^classmaterial/edit/(?P<publicationId>\d+)$', views.editClassMaterial, name='editClassMaterial'),

  # Event actions
  url(r'^events/$', views.events, name='events'),
  url(r'^events/create/$', views.createEvent, name='createEvent'),
  url(r'^events/(?P<eventId>\d+)$', views.eventDetails, name='eventDetails'),
  url(r'^events/edit/(?P<eventId>\d+)$', views.editEvent, name='editEvent'),

  # Job Offer actions
url(r'^joboffer/$', views.joboffer, name='joboffer'),
url(r'^joboffer/create/$', views.createJobOffer, name='createJobOffer'),
url(r'^joboffer/(?P<jobofferID>\d+)$', views.JobOfferDetail, name='JobOfferDetail'),


  # Lost and Found Actions(?P<lostandfoundID>\d
  url(r'^lostandfound/$', views.LostandFound, name='LostandFound'),
  url(r'^lostandfound/create/$', views.createLostAndFound, name='createLostAndFound'),
  url(r'^lostandfound/(?P<lostandfoundID>\d+)$', views.LostAndFoundDetails, name='LostAndFoundDetails'),
  url(r'^lostandfound/edit/(?P<lostandfoundId>\d+)$', views.editLostAndFound, name='editLostAndFound'),
  
  # Buy and Sell Actions
url(r'^buysell/$', views.buysell, name='buysell'),
url(r'^buysell/create/$', views.createBuySell, name='createBuySell'),
url(r'^buysell/(?P<buysellID>\d+)$', views.BuySellDetail, name=' BuySellDetail'),
url(r'^buysell/edit/(?P<buysellID>\d+)$', views.EditBuySell, name='EditBuySell'),
  #COurseMtaerial Actions
 url(r'^material/$', views.Coursematerial, name='Coursematerial'),
  url(r'^material/create/$', views.createCourseMaterial, name='createCourseMaterial'),

  url(r'^search/$', views.search, name='search'),
)
