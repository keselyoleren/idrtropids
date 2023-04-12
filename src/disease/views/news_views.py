import contextlib
from difflib import restore
from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView,
    DetailView
)
from django.views import View
from django.urls import reverse_lazy



from rest_framework import (
    generics,
    views,
    response,
    viewsets
)
from disease.models.diseases_model import Disease
from disease.models.disqus_model import Question
from disease.models.news_model import News
from disease.models.references_model import Article, Book

from disease.serializer.news import GetNewsSerialize, NewsSerializer
from helper.choices import StatusChoice
from helper.pagination import ResponsePagination
from users.models import UserAccount

class HomeView(ListView):
    template_name = "index.html"
    context_object_name = 'artikel'
    ordering = '-created_at'

    def get_queryset(self):
        try:
            return Article.objects.filter(status=StatusChoice.APROVED).order_by('-created_at')[:6]
        except Exception:
            return Article.objects.filter(status=StatusChoice.APROVED).order_by('-created_at')
    

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        with contextlib.suppress(Exception):
            context['news'] = News.objects.filter(status=StatusChoice.APROVED)[:6]
        context['diseases_count'] = Disease.objects.filter(status=StatusChoice.APROVED).count()
        context['book_count'] = Book.objects.filter(status=StatusChoice.APROVED).count()
        context['user_count'] = UserAccount.objects.count()
        context['questions'] = Question.objects.filter(status=StatusChoice.APROVED).order_by('created_at')[:5]
        return context

class HomeDetailView(DetailView):       
    model = News
    context_object_name = 'news'
    template_name = "detail.html"
    
    def get_context_data(self, **kwargs):
        return super().get_context_data(**kwargs)

class NewsListView(ListView):
    model = News
    context_object_name = 'news'
    template_name = "news/index.html"
    paginate_by = 12
    ordering = "-created_at"

    def get_queryset(self):
        return News.objects.filter(status=StatusChoice.APROVED).order_by('-created_at')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        paginator = context['paginator']
        page_numbers_range = 5  # Display 5 pages range by default
        # Calculate the current page number and the index of the first page in the range
        current_page = context['page_obj'].number
        first_page_in_range = max(current_page - page_numbers_range, 1)

        # Add the page range to the context
        context['page_range'] = range(first_page_in_range, paginator.num_pages + 1)[:page_numbers_range*2]
        context['title'] = 'Berita'
        context['url'] = 'berita-category'
        context['search_catagory'] = 'berita'
        return context

class NewsCategoryListView(ListView):
    model = News
    context_object_name = 'news'
    template_name = "news/list.html"
    paginate_by = 12
    ordering = "-created_at"

    def get_queryset(self):
        return News.objects.filter(status=StatusChoice.APROVED, category__name=self.kwargs['category']).order_by('-created_at')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        paginator = context['paginator']
        page_numbers_range = 5  # Display 5 pages range by default
        # Calculate the current page number and the index of the first page in the range
        current_page = context['page_obj'].number
        first_page_in_range = max(current_page - page_numbers_range, 1)

        # Add the page range to the context
        context['page_range'] = range(first_page_in_range, paginator.num_pages + 1)[:page_numbers_range*2]
        context['title'] = 'Berita'
        context['url'] = 'berita-category'
        context['penyakit'] = self.kwargs['category']
        context['search_catagory'] = 'berita'
        return context



class NewsDdetailView(DetailView):
    model = News
    context_object_name = 'news'
    template_name = "news/detail.html"
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    
    def get_context_data(self, **kwargs):
        instance = self.get_object()
        instance.visits += 1
        instance.save()
        context =  super().get_context_data(**kwargs)
        context['headline_news'] = self.get_queryset()[:5]
        context['url'] = 'berita-category'
        context['search_catagory'] = 'berita'
        return context

class NewsApiView(generics.ListAPIView, generics.RetrieveAPIView, viewsets.ModelViewSet):
    serializer_class = NewsSerializer
    queryset = News.objects.all()
    pagination_class = ResponsePagination

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    def retrieve(self, request, *args, **kwargs):
        instance = self.queryset.get(slug=self.kwargs['pk'])
        serialize = GetNewsSerialize(instance).data
        return response.Response(serialize)

