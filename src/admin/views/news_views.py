
from admin.form.news_form import NewsForm
from disease.models.news import News

from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView
)
from django.urls import reverse_lazy

from helper.permission import LoginAdminRequiredMixin


class ListNews(LoginAdminRequiredMixin, ListView):
    model = News
    context_object_name = 'news'
    template_name = "admin/page/news/list.html"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'List News'
        context['btn_name'] = 'Tambah News'
        context['header'] = 'News'
        context['nav_News'] = True
        return context

class CreateNews(LoginAdminRequiredMixin, CreateView):
    model = News
    form_class = NewsForm
    context_object_name = 'News'
    template_name = "admin/form/create.html"
    success_url = reverse_lazy('list_news')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'List News'
        context['btn_name'] = 'Tambah News'
        context['header'] = 'News'
        context['nav_News'] = True
        return context

   
class UpdateNews(LoginAdminRequiredMixin, UpdateView):
    model = News
    form_class = NewsForm
    context_object_name = 'News'
    template_name = "admin/form/update.html"
    success_url = reverse_lazy('list_news')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit News'
        context['btn_name'] = 'Edit News'
        context['header'] = 'News'
        context['nav_News'] = True
        return context

class DeleteNews(LoginAdminRequiredMixin, DeleteView):
    model = News
    template_name = 'admin/form/delete.html'
    success_url = reverse_lazy('list_news')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Delete News'
        context['btn_name'] = 'Delete News'
        context['header'] = 'News'
        context['nav_News'] = True
        return context