from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)
from disease.models.diseases import Disease
from disease.models.news import News
from disease.models.references import Article, Book, Report
from disease.serializer.article import ArticleSerializer, GetArticleSerialize
from disease.serializer.book import BookSerializer
from disease.serializer.diseases import DiseasesSerializer
from disease.serializer.news import NewsSerializer
from disease.serializer.report import GetReportSerialize, ReportSerializer
from disease.views.book_views import BookListView
from helper.choices import StatusChoice
from helper.pagination import ResponsePagination

class SearchApiView(generics.ListAPIView, viewsets.ModelViewSet, ResponsePagination):
    serializer_class = ReportSerializer
    

    def list(self, request, *args, **kwargs):
        category = request.GET.get('category')
        query = request.GET.get('keyword')
        
        res = []
        
        if category == 'all':
            object_diseases = Disease.objects.filter(disease_name__icontains=query, status=StatusChoice.APROVED)
            res.extend(DiseasesSerializer(object_diseases, many=True).data)
            object_book = Book.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
            res.extend(BookSerializer(object_book, many=True).data)
            object_artikel = Article.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
            res.extend(ArticleSerializer(object_artikel, many=True).data)
            object_report = Report.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
            res.extend(ReportSerializer(object_report, many=True).data)
            object_news = News.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
            res.extend(NewsSerializer(object_news, many=True).data)

        if category == 'penyakit menular':
            object_diseases = Disease.objects.filter(disease_name__icontains=query, status=StatusChoice.APROVED)
            res.extend(DiseasesSerializer(object_diseases, many=True).data)

        if category == 'buku':
            object_book = Book.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
            res.extend(BookSerializer(object_book, many=True).data)

        if category == 'artikel':
            object_artikel = Article.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
            res.extend(ArticleSerializer(object_artikel, many=True).data)

        if category == 'laporan':
            object_report = Report.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
            res.extend(ReportSerializer(object_report, many=True).data)
        
        if category == 'berita':
            object_news = News.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
            res.extend(NewsSerializer(object_news, many=True).data)

        paginated_data = self.paginate_no_queryset(res, request)
        if paginated_data is not None:
            return self.get_paginated_response_without_queryset(paginated_data)

        return response.Response({"results":res})



    