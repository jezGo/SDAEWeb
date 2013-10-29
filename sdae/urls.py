from django.conf.urls import patterns, include, url

from django.conf.urls import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

from django.conf import settings

from django.contrib.auth.views import login, logout

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'sdae.views.home', name='home'),
    # url(r'^sdae/', include('sdae.foo.urls')),
    url(r'^login/$', login, name='login'),
    url(r'^logout/$', logout, {'next_page':'/login'}, name='logout'),

    url(r'^publications/', include('publications.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
