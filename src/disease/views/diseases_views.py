import contextlib
from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)
from disease.models.diseases import Disease
from disease.models.disqus import Question
from disease.serializer.diseases import DiseaseSerialize
from helper.choices import StatusChoice
from helper.pagination import ResponsePagination

from django.views.generic import (
    ListView,
    DetailView
)

class DiseasesApiView(generics.ListAPIView, viewsets.ModelViewSet):
    queryset = Disease.objects.all()
    serializer_class = DiseaseSerialize
    pagination_class = ResponsePagination

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)


class DiseasesListView(ListView):
    model = Disease
    context_object_name = 'diseases'
    template_name = "diseases/list.html"
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    paginate_by = 12
    ordering = "-created_at"

    def get_queryset(self):
        return Disease.objects.filter(status=StatusChoice.APROVED).order_by('-created_at')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        paginator = context['paginator']
        page_numbers_range = 5  # Display 5 pages range by default
        # Calculate the current page number and the index of the first page in the range
        current_page = context['page_obj'].number
        first_page_in_range = max(current_page - page_numbers_range, 1)

        # Add the page range to the context
        context['page_range'] = range(first_page_in_range, paginator.num_pages + 1)[:page_numbers_range*2]
        return context

class DiseasesDetailView(DetailView):
    model = Disease
    context_object_name = 'diseases'
    template_name = "diseases/detail.html"
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    
    def get_context_data(self, **kwargs):
        instance = self.get_object()
        instance.visits += 1
        instance.save()
        context =  super().get_context_data(**kwargs)
        with contextlib.suppress(Exception):
            context['latest_post'] = Disease.objects.filter(status=StatusChoice.APROVED).order_by('-created_at')[:5]
            context['questions'] = Question.objects.filter(diseases=instance)[:5]
        return context