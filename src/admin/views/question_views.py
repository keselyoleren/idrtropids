
from django.urls import reverse_lazy
from admin.form.disqus_form import QuestionFormAdmin
from disease.forms.disqus_form import QuestionForm
from disease.models.disqus_model import Answer, Question

from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView,
    DetailView
)
from django.contrib import messages

from helper.permission import LoginAdminRequiredMixin, LoginRequiredMixin


class ListQuestionView(LoginAdminRequiredMixin, ListView):
    model = Question
    context_object_name = 'questions'
    template_name = "admin/page/question/list.html"

    def get_queryset(self):
        if self.request.user.profile.status_verified == 'Verified':
            return Question.objects.filter(asign_to__in=[self.request.user]).order_by('created_at')
        else:    
            return Question.objects.filter(user=self.request.user).order_by('created_at')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'List pertanyaan anda'
        context['header'] = 'List Pertanyaan'
        context['nav_disqus'] = True
        return context




class UpdateQuestionView(LoginAdminRequiredMixin, UpdateView):
    model = Question
    context_object_name = 'question'
    template_name = "admin/form/update.html"
    form_class = QuestionFormAdmin
    success_url = reverse_lazy('list_question')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit Pertanyaan'
        context['header'] = 'Edit Pertanyaan'
        context['card_title'] = 'Edit Pertanyaan'
        context['nav_disqus'] = True
        return context

    def form_valid(self, form):
        form.instance.user = self.request.user
        form.save()
        messages.success(self.request, "Berhasil diupdate")
        return super().form_valid(form)



class DetailQuestionView(LoginAdminRequiredMixin, DetailView):
    model = Question
    context_object_name = 'question'
    template_name = "admin/page/question/detail.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detail Pertanyaan'
        context['header'] = 'Detail Pertanyaan'
        context['answer'] = Answer.objects.filter(question=self.get_object())
        context['nav_disqus'] = True
        return context


class DeleteQuestionView(LoginRequiredMixin, DeleteView):
    model = Question
    template_name = 'admin/form/delete.html'
    success_url = reverse_lazy('list_question')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Hapus Pertanyaan'
        context['btn_name'] = 'Hapus Peryanaan'
        context['header'] = 'Peryanyaan'
        context['nav_question'] = True
        return context
    