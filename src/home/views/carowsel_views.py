from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)

from home.models import Carousel
from ..serialize.carousel_serialize import CarouselSerialize

class CarouselApiView(viewsets.ModelViewSet):
    serializer_class = CarouselSerialize
    queryset = Carousel.objects.all()

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)