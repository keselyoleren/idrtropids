from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)
from disease.models.diseases import Disease
from disease.serializer.diseases import DiseaseSerialize
from helper.pagination import ResponsePagination

class DiseasesApiView(generics.ListAPIView, viewsets.ModelViewSet):
    queryset = Disease.objects.all()
    serializer_class = DiseaseSerialize
    pagination_class = ResponsePagination

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)