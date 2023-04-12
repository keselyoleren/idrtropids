from multiprocessing.reduction import AbstractReducer
from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView,
    DetailView
)


from disease.models.references_model import *


class ArticleView(ListView):
    model = Article
    context_object_name = 'articles'
    template_name = "articles/index.html"
    ordering = "-created_at"

    def get_queryset(self):
        return Article.objects.filter(status=StatusChoice.APROVED).order_by('-created_at')[:6]
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Artikel'
        context['url'] = 'article-category'
        context['search_catagory'] = 'artikel'
        return context

class ArticleCategoryView(ListView):
    model = Article
    context_object_name = 'articles'
    template_name = "articles/list.html"
    paginate_by = 12
    ordering = "-created_at"

    def get_queryset(self):
        return Article.objects.filter(status=StatusChoice.APROVED, category__name=self.kwargs['category']).order_by('-created_at')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        paginator = context['paginator']
        page_numbers_range = 5  # Display 5 pages range by default
        # Calculate the current page number and the index of the first page in the range
        current_page = context['page_obj'].number
        first_page_in_range = max(current_page - page_numbers_range, 1)

        # Add the page range to the context
        context['page_range'] = range(first_page_in_range, paginator.num_pages + 1)[:page_numbers_range*2]
        context['title'] = 'Artikel'
        context['url'] = 'article-category'
        context['search_catagory'] = 'artikel'
        context['penyakit'] = self.kwargs['category']
        return context


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
        context =  super().get_context_data(**kwargs)
        context['url'] = 'article-category'
        context['search_catagory'] = 'artikel'
        return context
