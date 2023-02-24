from admin.form.book_form import BookForm
from disease.models.references import *

from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView
)
from django.urls import reverse_lazy

from helper.permission import LoginAdminRequiredMixin




class ListBook(LoginAdminRequiredMixin, ListView):
    model = Book
    context_object_name = 'book'
    template_name = "admin/page/book/list.html"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'List Buku'
        context['btn_name'] = 'Tambah Buku'
        context['header'] = 'Buku'
        context['nav_book'] = True
        return context

class CreateBook(LoginAdminRequiredMixin, CreateView):
    model = Book
    form_class = BookForm
    context_object_name = 'book'
    template_name = "admin/form/create.html"
    success_url = reverse_lazy('contributor_list_book')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'List Buku'
        context['card_title'] = 'Tambah Buku'
        context['btn_name'] = 'Tambah Buku'
        context['header'] = 'Buku'
        context['nav_book'] = True
        return context

   
class UpdateBook(LoginAdminRequiredMixin, UpdateView):
    model = Book
    form_class = BookForm
    context_object_name = 'book'
    template_name = "admin/form/update.html"
    success_url = reverse_lazy('contributor_list_book')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit Buku'
        context['btn_name'] = 'Edit Buku'
        context['header'] = 'Buku'
        context['nav_book'] = True
        return context

class DeleteBook(LoginAdminRequiredMixin, DeleteView):
    model = Book
    template_name = 'admin/form/delete.html'
    success_url = reverse_lazy('contributor_list_book')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Delte Buku'
        context['btn_name'] = 'Delete Buku'
        context['header'] = 'Buku'
        context['nav_book'] = True
        return context