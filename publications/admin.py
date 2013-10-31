from django.contrib import admin
from publications.models import Tag, PublicationType, Publication, SDAEUser, Comment, Vote, Map, LocationType, Location, Event, EventActivity, JobType, Company, JobOffer, BuySell, LostAndFound
from schoolInfo.models import Subject, Teacher, Course, ClassSession

admin.site.register(Tag)
admin.site.register(PublicationType)
admin.site.register(Publication)
admin.site.register(SDAEUser)
admin.site.register(Comment)
admin.site.register(Vote)
admin.site.register(Map)
admin.site.register(LocationType)
admin.site.register(Location)
admin.site.register(Event)
admin.site.register(EventActivity)
admin.site.register(JobType)
admin.site.register(Company)
admin.site.register(JobOffer)
admin.site.register(BuySell)
admin.site.register(LostAndFound)

admin.site.register(Subject)
admin.site.register(Teacher)
admin.site.register(Course)
admin.site.register(ClassSession)