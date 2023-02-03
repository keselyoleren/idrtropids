from rest_framework import routers
from disease.views.diseases import DiseasesApiView

from disease.views.news import NewsApiView
from django.urls import path, include

route = routers.DefaultRouter()
route.register('news', NewsApiView)
route.register('diseases', DiseasesApiView)

urlpatterns = [
    path('', include(route.urls)),
]
