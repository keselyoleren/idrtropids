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
from helper.pagination import ResponsePagination

class CarouselApiView(viewsets.ModelViewSet):
    serializer_class = CarouselSerialize
    queryset = Carousel.objects.all()
    pagination_class = ResponsePagination

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)