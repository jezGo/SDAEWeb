from django.contrib import admin
from publications.models import Tag, PublicationType, Publication, SDAEUser, Comment, Vote, Map, LocationType, Location, Event, JobType, Company, JobOffer, BuySell, LostAndFound, Student, UserTeacher, SchoolDepartment, StudentsClub, UserType
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
admin.site.register(JobType)
admin.site.register(Company)
admin.site.register(JobOffer)
admin.site.register(BuySell)
admin.site.register(LostAndFound)
admin.site.register(Student)
admin.site.register(UserTeacher)
admin.site.register(SchoolDepartment)
admin.site.register(StudentsClub)
admin.site.register(UserType)

admin.site.register(Subject)
admin.site.register(Teacher)
admin.site.register(Course)
admin.site.register(ClassSession)