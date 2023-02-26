from admin.form.report_form import ReportForm
from disease.models.references import *

from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView
)
from django.urls import reverse_lazy
from helper.choices import StatusVerified

from helper.permission import LoginAdminRequiredMixin
from users.form.profile_form import ProfileForm
from users.models import Profile

class ProfileUpdaclass(LoginAdminRequiredMixin, UpdateView):
    model = Profile
    form_class = ProfileForm
    context_object_name = 'article'
    template_name = "admin/form/update.html"
    success_url = reverse_lazy('contributor_profile')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit Article'
        context['btn_name'] = 'Edit Article'
        context['header'] = 'Article'
        context['nav_article'] = True
        return context
    
    def form_valid(self, form):
        form.instance.user = self.request.user
        if self.get_object().status_verified == StatusVerified.VERIFIED:
            form.instance.status_verified = StatusVerified.VERIFIED
        else:
            form.instance.status_verified = StatusVerified.WAITING
        form.save()
        return super().form_valid(form)    