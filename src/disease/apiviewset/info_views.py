from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)
from disease.models.diseases_model import Category
from disease.serializer.category import CategorySerializer
from disease.serializer.info_serialize import DetailinfoSerialize, ListInfoSerializer
from helper.pagination import ResponsePagination
from home.models import Info

class InfoApiView(viewsets.ModelViewSet):
    serializer_class = ListInfoSerializer
    queryset = Info.objects.all()
    pagination_class = ResponsePagination

    def get_serializer_class(self):
        return DetailinfoSerialize if self.action == 'retrieve' else ListInfoSerializer

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    def retrieve(self, request, *args, **kwargs):
        return super().retrieve(request, *args, **kwargs)