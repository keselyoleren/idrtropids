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
from disease.models.news import News

from disease.serializer.news import NewsSerializer, RetriveNewsSerialize
from helper.pagination import ResponsePagination

class HomeView(ListView):
    model = News
    template_name = "index.html"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['news'] = News.objects.all().first()
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
    template_name = "news/list.html"
    paginate_by = 2
    
    def get_context_data(self, **kwargs):
        return super().get_context_data(**kwargs)

class NewsDdetailView(DetailView):
    model = News
    context_object_name = 'news'
    template_name = "news/detail.html"
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    
    def get_context_data(self, **kwargs):
        return super().get_context_data(**kwargs)

class NewsApiView(generics.ListAPIView, generics.RetrieveAPIView, viewsets.ModelViewSet):
    serializer_class = NewsSerializer
    queryset = News.objects.all()
    pagination_class = ResponsePagination

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    def retrieve(self, request, *args, **kwargs):
        instance = self.queryset.get(slug=self.kwargs['pk'])
        serialize = RetriveNewsSerialize(instance).data
        return response.Response(serialize)

