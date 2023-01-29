from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView,
    DetailView
)
from django.views import View
from django.urls import reverse_lazy

from disease.models import News

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