from django.views.generic import (
    ListView,
    DetailView
)
from django.views import View
from django.urls import reverse_lazy
from disease.models.news_model import News
from disease.models.references_model import *
from home.models import Info


class InfoDetailView(DetailView):
    model = Info
    context_object_name = 'info'
    template_name = "info/detail.html"
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    
    def get_context_data(self, **kwargs):
        context =  super().get_context_data(**kwargs)
        context['url'] = ''
        context['search_catagory'] = ''
        return context
