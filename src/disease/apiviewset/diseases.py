from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)
from disease.models.diseases_model import Disease
from disease.models.disqus_model import Answer, Question
from disease.models.references_model import Article, Report
from disease.serializer.article import ArticleSerializer, GetArticleSerialize
from disease.serializer.diseases import DiseasesSerializer, GetDiseasesRetriveSerialize
from disease.serializer.disqus import AnswerReadonlySerialize, QuestionReadOnlySerialize
from disease.serializer.report import GetReportSerialize, ReportSerializer
from helper.choices import StatusChoice
from helper.pagination import ResponsePagination

class DiseasesApiView(viewsets.ModelViewSet):
    serializer_class = DiseasesSerializer
    queryset = Disease.objects.all()
    pagination_class = ResponsePagination
    

    def get_queryset(self):
        return self.queryset.filter(status=StatusChoice.APROVED).order_by('created_at')
    
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance_question = Question.objects.filter(diseases=instance)[:5]
        instance.visits += 1
        instance.save()
        serialize = GetDiseasesRetriveSerialize(instance).data
        serialize['questions'] = QuestionReadOnlySerialize(instance_question, many=True).data
        return response.Response(serialize)