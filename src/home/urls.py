from rest_framework import routers
from home.views.carowsel_views import CarouselApiView

route = routers.DefaultRouter()
route.register('carousel', CarouselApiView, basename="api-carousel")

home_url = route.urls

