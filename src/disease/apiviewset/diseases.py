from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)
from disease.models.diseases import Disease
from disease.models.references import Article, Report
from disease.serializer.article import ArticleSerializer, GetArticleSerialize
from disease.serializer.diseases import DiseasesSerializer, GetDiseasesRetriveSerialize
from disease.serializer.report import GetReportSerialize, ReportSerializer
from helper.pagination import ResponsePagination

class DiseasesApiView(generics.ListAPIView, generics.RetrieveAPIView, viewsets.ModelViewSet):
    serializer_class = DiseasesSerializer
    queryset = Disease.objects.all()
    pagination_class = ResponsePagination

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.visits += 1
        instance.save()
        serialize = GetDiseasesRetriveSerialize(instance).data
        return response.Response(serialize)