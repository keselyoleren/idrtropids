
from admin.form.article_form import ArticleForm
from disease.models.references import *

from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView
)
from django.urls import reverse_lazy

from helper.permission import LoginAdminRequiredMixin




class ListArticle(LoginAdminRequiredMixin, ListView):
    model = Article
    context_object_name = 'article'
    template_name = "admin/page/article/list.html"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'List Article'
        context['btn_name'] = 'Tambah Article'
        context['header'] = 'Article'
        context['nav_article'] = True
        return context

class CreateArticle(LoginAdminRequiredMixin, CreateView):
    model = Article
    form_class = ArticleForm
    context_object_name = 'article'
    template_name = "admin/form/create.html"
    success_url = reverse_lazy('contributor_list_article')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'List Article'
        context['btn_name'] = 'Tambah Article'
        context['header'] = 'Article'
        context['nav_article'] = True
        return context

   
class UpdateArticle(LoginAdminRequiredMixin, UpdateView):
    model = Article
    form_class = ArticleForm
    context_object_name = 'article'
    template_name = "admin/form/update.html"
    success_url = reverse_lazy('contributor_list_article')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit Article'
        context['btn_name'] = 'Edit Article'
        context['header'] = 'Article'
        context['nav_article'] = True
        return context

class DeleteArticle(LoginAdminRequiredMixin, DeleteView):
    model = Article
    template_name = 'admin/form/delete.html'
    success_url = reverse_lazy('contributor_list_article')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Delte Article'
        context['btn_name'] = 'Delete Article'
        context['header'] = 'Article'
        context['nav_article'] = True
        return context