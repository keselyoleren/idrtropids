from django.shortcuts import render
from django.views.generic import View

from disease.models.diseases import Disease
from disease.models.news import News
from disease.models.references import Article, Book, Report


class SearchView(View):

    def get(self, request):
        query = request.GET.get('keyword')
        if query:
            object_diseases = Disease.objects.filter(disease_name__icontains=query)
            object_book = Book.objects.filter(title__icontains=query)
            object_artikel = Article.objects.filter(title__icontains=query)
            object_report = Report.objects.filter(title__icontains=query)
            object_news = News.objects.filter(title__icontains=query)
        else:
            object_diseases = Disease.objects.none()
            object_artikel = Article.objects.none()
            object_book = Book.objects.none()
            object_report = Report.objects.none()
            object_news = News.objects.none()
        
        context = {
            'key_result':query,
            'object_diseases': object_diseases,
            'object_news': object_news,
            'object_report': object_report,
            'object_artikel': object_artikel,
            'object_book': object_book,
        }
        return render(request, 'search/result.html', context=context)
        

