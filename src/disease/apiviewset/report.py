from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)
from disease.models.references import Article, Report
from disease.serializer.article import ArticleSerializer, GetArticleSerialize
from disease.serializer.report import GetReportSerialize, ReportSerializer
from helper.pagination import ResponsePagination

class ReportApiView(generics.ListAPIView, generics.RetrieveAPIView, viewsets.ModelViewSet):
    serializer_class = ReportSerializer
    queryset = Report.objects.all()
    pagination_class = ResponsePagination

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.visits += 1
        instance.save()
        serialize = GetReportSerialize(instance).data
        return response.Response(serialize)