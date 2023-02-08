from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView,
    DetailView
)
from django.views import View
from django.urls import reverse_lazy
from disease.models.news import News
from disease.models.references import *

class ArticleView(ListView):
    model = Article
    context_object_name = 'articles'
    template_name = "articles/list.html"
    paginate_by = 2
    
    def get_context_data(self, **kwargs):
        return super().get_context_data(**kwargs)

class ArticleDetailView(DetailView):
    model = Article
    context_object_name = 'article'
    template_name = "articles/detail.html"
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    
    def get_context_data(self, **kwargs):
        print(self.get_object())
        return super().get_context_data(**kwargs)