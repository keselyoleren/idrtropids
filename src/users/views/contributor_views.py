from django.views.generic import TemplateView

from helper.permission import LoginAdminRequiredMixin


class ContributorProfileVIew(LoginAdminRequiredMixin, TemplateView):
    template_name = 'admin/page/profile.html'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['nav_home'] = True
        return context