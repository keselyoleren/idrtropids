from django.views.generic import (
    ListView,
    DetailView
)
from django.views import View
from django.urls import reverse_lazy
from disease.models.news_model import News
from disease.models.references_model import *

class BookListView(ListView):
    model = Book
    context_object_name = 'books'
    template_name = "book/index.html"
    paginate_by = 12
    ordering = "-created_at"

    def get_queryset(self):
        return Book.objects.filter(status=StatusChoice.APROVED).order_by('-created_at')[:6]
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        paginator = context['paginator']
        page_numbers_range = 5  # Display 5 pages range by default
        # Calculate the current page number and the index of the first page in the range
        current_page = context['page_obj'].number
        first_page_in_range = max(current_page - page_numbers_range, 1)

        # Add the page range to the context
        context['page_range'] = range(first_page_in_range, paginator.num_pages + 1)[:page_numbers_range*2]
        context['title'] = 'Buku'
        context['url'] = 'buku-category'
        context['search_catagory'] = 'buku'
        return context

class BookCategoryListView(ListView):
    model = Book
    context_object_name = 'books'
    template_name = "book/list.html"
    paginate_by = 12
    ordering = "-created_at"

    def get_queryset(self):
        return Book.objects.filter(status=StatusChoice.APROVED, category__name=self.kwargs['category']).order_by('-created_at')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        paginator = context['paginator']
        page_numbers_range = 5  # Display 5 pages range by default
        # Calculate the current page number and the index of the first page in the range
        current_page = context['page_obj'].number
        first_page_in_range = max(current_page - page_numbers_range, 1)

        # Add the page range to the context
        context['page_range'] = range(first_page_in_range, paginator.num_pages + 1)[:page_numbers_range*2]
        context['title'] = 'Buku'
        context['url'] = 'buku-category'
        context['penyakit'] = self.kwargs['category']
        context['search_catagory'] = 'buku'
        return context

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
        context =  super().get_context_data(**kwargs)
        context['url'] = 'buku-category'
        context['search_catagory'] = 'buku'
        return context
