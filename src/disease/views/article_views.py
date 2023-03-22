from multiprocessing.reduction import AbstractReducer
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
from helper.choices import StatusVerified

class ArticleView(ListView):
    model = Article
    context_object_name = 'articles'
    template_name = "articles/list.html"
    paginate_by = 12
    ordering = "-created_at"

    def get_queryset(self):
        return Article.objects.filter(status=StatusChoice.APROVED).order_by('-created_at')
    
    def get_context_data(self, **kwargs):
        return super().get_context_data(**kwargs)

class ArticleDetailView(DetailView):
    model = Article
    context_object_name = 'article'
    template_name = "articles/detail.html"
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    
    def get_context_data(self, **kwargs):
        instance = self.get_object()
        instance.visits += 1
        instance.save()
        return super().get_context_data(**kwargs)
