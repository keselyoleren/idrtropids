from django.views.generic import (
    ListView,
    DetailView
)
from django.views import View
from django.urls import reverse_lazy
from disease.models.news_model import News
from disease.models.references_model import *

class ReportListView(ListView):
    model = Report
    context_object_name = 'reports'
    template_name = "report/index.html"
    paginate_by = 12
    ordering = "-created_at"

    def get_queryset(self):
        return Report.objects.filter(status=StatusChoice.APROVED).order_by('-created_at')[:6]
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        paginator = context['paginator']
        page_numbers_range = 5  # Display 5 pages range by default
        # Calculate the current page number and the index of the first page in the range
        current_page = context['page_obj'].number
        first_page_in_range = max(current_page - page_numbers_range, 1)

        # Add the page range to the context
        context['page_range'] = range(first_page_in_range, paginator.num_pages + 1)[:page_numbers_range*2]
        context['title'] = 'Laporan'
        context['url'] = 'report-category'
        context['search_catagory'] = 'laporan'
        return context

class ReportCategoryListView(ListView):
    model = Report
    context_object_name = 'reports'
    template_name = "report/list.html"
    paginate_by = 12
    ordering = "-created_at"

    def get_queryset(self):
        return Report.objects.filter(status=StatusChoice.APROVED, category__name=self.kwargs['category']).order_by('-created_at')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        paginator = context['paginator']
        page_numbers_range = 5  # Display 5 pages range by default
        # Calculate the current page number and the index of the first page in the range
        current_page = context['page_obj'].number
        first_page_in_range = max(current_page - page_numbers_range, 1)

        # Add the page range to the context
        context['page_range'] = range(first_page_in_range, paginator.num_pages + 1)[:page_numbers_range*2]
        context['title'] = 'Laporan'
        context['url'] = 'report-category'
        context['penyakit'] = self.kwargs['category']
        context['search_catagory'] = 'laporan'
        return context

class ReportDetailView(DetailView):
    model = Report
    context_object_name = 'report'
    template_name = "report/details.html"
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    
    def get_context_data(self, **kwargs):
        instance = self.get_object()
        instance.visits += 1
        instance.save()
        context =  super().get_context_data(**kwargs)
        context['url'] = 'report-category'
        context['search_catagory'] = 'laporan'
        return context
