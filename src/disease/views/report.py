from django.views.generic import (
    ListView,
    DetailView
)
from django.views import View
from django.urls import reverse_lazy
from disease.models.news import News
from disease.models.references import *

class ReportListView(ListView):
    model = Report
    context_object_name = 'reports'
    template_name = "report/list.html"
    paginate_by = 2
    
    def get_context_data(self, **kwargs):
        return super().get_context_data(**kwargs)

class ReportDetailView(DetailView):
    model = Report
    context_object_name = 'report'
    template_name = "report/details.html"
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    
    def get_context_data(self, **kwargs):
        return super().get_context_data(**kwargs)
