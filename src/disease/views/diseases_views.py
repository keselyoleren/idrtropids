from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)
from disease.models.diseases import Disease
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
        return super().get_context_data(**kwargs)