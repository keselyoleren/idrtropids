from django.views.generic import (
    ListView,
    DetailView
)
from django.views import View
from django.urls import reverse_lazy
from disease.models.news import News
from disease.models.references import *

class BookListView(ListView):
    model = Book
    context_object_name = 'books'
    template_name = "book/list.html"
    paginate_by = 12

    def get_queryset(self):
        return Book.objects.filter(status=StatusChoice.APROVED)
    
    def get_context_data(self, **kwargs):
        return super().get_context_data(**kwargs)

class BookDetailView(DetailView):
    model = Book
    context_object_name = 'book'
    template_name = "book/detail.html"
    slug_field = 'slug'
    slug_url_kwarg = 'slug'
    
    def get_context_data(self, **kwargs):
        instance = self.get_object()
        instance.visits += 1
        instance.save()
        return super().get_context_data(**kwargs)
