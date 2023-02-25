from admin.form.report_form import ReportForm
from disease.models.references import *

from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView
)
from django.urls import reverse_lazy

from helper.permission import LoginAdminRequiredMixin


class ListReport(LoginAdminRequiredMixin, ListView):
    model = Report
    context_object_name = 'report'
    template_name = "admin/page/report/list.html"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'List Report'
        context['btn_name'] = 'Tambah Report'
        context['header'] = 'Report'
        context['nav_report'] = True
        return context

class CreateReport(LoginAdminRequiredMixin, CreateView):
    model = Report
    form_class = ReportForm
    context_object_name = 'report'
    template_name = "admin/form/create.html"
    success_url = reverse_lazy('contributor_list_report')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'List Report'
        context['btn_name'] = 'Tambah Report'
        context['header'] = 'Report'
        context['nav_report'] = True
        return context

    def form_valid(self, form):
        form.instance.created_by = self.request.user
        form.save()
        return super().form_valid(form)    


   
class UpdateReport(LoginAdminRequiredMixin, UpdateView):
    model = Report
    form_class = ReportForm
    context_object_name = 'report'
    template_name = "admin/form/update.html"
    success_url = reverse_lazy('contributor_list_report')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit Report'
        context['btn_name'] = 'Edit Report'
        context['header'] = 'Report'
        context['nav_report'] = True
        return context

    def form_valid(self, form):
        form.instance.created_by = self.request.user
        form.save()
        return super().form_valid(form)    


class DeleteReport(LoginAdminRequiredMixin, DeleteView):
    model = Report
    template_name = 'admin/form/delete.html'
    success_url = reverse_lazy('contributor_list_report')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Delte Report'
        context['btn_name'] = 'Delete Report'
        context['header'] = 'Report'
        context['nav_report'] = True
        return context