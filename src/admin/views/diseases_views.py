


from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView
)
from django.urls import reverse_lazy
from admin.form.disease_form import DiseaseForm
from disease.models.diseases_model import Disease
from disease.models.disqus_model import Question
from helper.permission import IsContributor, LoginAdminRequiredMixin


class ListDiseases(IsContributor, ListView):
    model = Disease
    template_name = "admin/page/diseases/list.html"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'List Diseases'
        context['diseases'] = Disease.objects.filter(created_by=self.request.user)
        context['btn_name'] = 'Tambah Diseases'
        context['header'] = 'Diseases'
        context['nav_diseases'] = True
        return context

class CreateDiseases(IsContributor, CreateView):
    model = Disease
    form_class = DiseaseForm
    context_object_name = 'Diseases'
    template_name = "admin/form/create.html"
    success_url = reverse_lazy('contributor_list_diseases')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'List Diseases'
        context['btn_name'] = 'Tambah Diseases'
        context['header'] = 'Diseases'
        context['nav_diseases'] = True
        return context

    def form_valid(self, form):
        form.instance.created_by = self.request.user
        form.save()
        return super().form_valid(form)

   
class UpdateDiseases(IsContributor, UpdateView):
    model = Disease
    form_class = DiseaseForm
    context_object_name = 'Diseases'
    template_name = "admin/form/update.html"
    success_url = reverse_lazy('contributor_list_diseases')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit Diseases'
        context['btn_name'] = 'Edit Diseases'
        context['header'] = 'Diseases'
        context['nav_diseases'] = True
        return context

class DeleteDiseases(IsContributor, DeleteView):
    model = Disease
    template_name = 'admin/form/delete.html'
    success_url = reverse_lazy('contributor_list_diseases')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Delete Diseases'
        context['btn_name'] = 'Delete Diseases'
        context['header'] = 'Diseases'
        context['nav_diseases'] = True
        return context