"""config URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.shortcuts import render
from django.urls import path, include
from django.conf.urls import url
from django.conf.urls.static import static
from django.conf import settings
from django.views.generic import TemplateView

from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework import permissions

from disease.views.news import HomeDetailView, HomeView
from disease.urls import page_urls

schema_view = get_schema_view(
   openapi.Info(
      title="Snippets API",
      default_version='v1',
   ),
   public=True,
   permission_classes=(permissions.AllowAny,),
)


urlpatterns = [
    path("<int:pk>/", HomeDetailView.as_view(), name='detail'),
    path("", HomeView.as_view(), name='home'),
    # path("", TemplateView.as_view(template_name='admin/page/profile.html')),
    path('admin/', admin.site.urls),
    path('accounts/', include('allauth.urls')),
    path('page/', include([
        path('', include('disease.urls')),
    ])),

    path('contributor/', include([
        path("", TemplateView.as_view(template_name='admin/page/profile.html'), name='contributor_profile'),
        path("profile", TemplateView.as_view(template_name='admin/page/profile.html'), name='contributor_profile'),
        path("page/", include('admin.urls')),
        path("qna", TemplateView.as_view(template_name='admin/page/qna/list.html'), name='contributor_list_qna'),
        path("disiases", TemplateView.as_view(template_name='admin/page/disiases/list.html'), name='contributor_list_disiases'),
        path('auth/', include([
            path("login", TemplateView.as_view(template_name='admin/auth/login.html'), name='contributor_login'),
            path("register", TemplateView.as_view(template_name='admin/auth/register.html'), name='contributor_register'),
        ]))
    ])),

    path('api/v1/', include([
        path('page/', include(page_urls)),
        path('auth/', include('users.urls')),
    ]))
]

if settings.DEBUG:
    urlpatterns += [
        url(r'^swagger(?P<format>\.json|\.yaml)$', schema_view.without_ui(cache_timeout=0), name='schema-json'),
        url(r'^swagger/$', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
        url(r'^redoc/$', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc')
    ]


urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
