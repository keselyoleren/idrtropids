from django.shortcuts import render
from django.views.generic import View

from disease.models.diseases_model import Disease
from disease.models.news_model import News
from disease.models.references_model import Article, Book, Report
from helper.choices import StatusChoice


class SearchView(View):

    def get(self, request):
        query = request.GET.get('keyword')
        category = request.GET.get('category')
        context = {}
        if query:
            if not category:
                object_diseases = Disease.objects.filter(disease_name__icontains=query, status=StatusChoice.APROVED)
                object_book = Book.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
                object_artikel = Article.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
                object_report = Report.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
                object_news = News.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
                context = {
                    'key_result':query,
                    'object_diseases': object_diseases,
                    'object_news': object_news,
                    'object_report': object_report,
                    'object_artikel': object_artikel,
                    'object_book': object_book,
                }

            if category == 'penyakit menular':
                object_diseases = Disease.objects.filter(disease_name__icontains=query, status=StatusChoice.APROVED)
                context = {
                    'key_result':query,
                    'object_diseases': object_diseases
                }

            if category == 'buku':
                object_book = Book.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
                context = {
                    'key_result':query,
                    'object_book': object_book
                }

            if category == 'artikel':
                object_artikel = Article.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
                context = {
                    'key_result':query,
                    'object_artikel': object_artikel,
                }

            if category == 'laporan':
                object_report = Report.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
                context = {
                    'key_result':query,
                    'object_report': object_report,
                }
            
            if category == 'berita':
                object_news = News.objects.filter(title__icontains=query, status=StatusChoice.APROVED)
                context = {
                    'key_result':query,
                    'object_news': object_news,
                }
            
        
        return render(request, 'search/result.html', context=context)
        