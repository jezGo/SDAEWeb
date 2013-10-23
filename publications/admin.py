from django.contrib import admin
from publications.models import Tag, PublicationType, Publication, SDAEUser

admin.site.register(Tag)
admin.site.register(PublicationType)
admin.site.register(Publication)
admin.site.register(SDAEUser)
