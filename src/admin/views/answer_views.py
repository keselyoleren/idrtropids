
from django.shortcuts import get_object_or_404
from django.urls import reverse_lazy
from admin.form.disqus_form import AnswerForm
from disease.models.disqus_model import Answer, Question

from django.views.generic import (
    ListView,
    CreateView, 
    UpdateView,
    DeleteView,
    DetailView
)
from django.contrib import messages

from helper.permission import IsContributor


class CreateAnswerView(IsContributor, CreateView):
    model = Answer
    form_class = AnswerForm
    context_object_name = 'answer'
    template_name = "admin/page/question/answer.html"

    def get_instance_questions(self, question_id):
        return get_object_or_404(Question, id=question_id)
    
    
    def get_success_url(self):
        return f"/contributor/page/question/{self.kwargs['question_id']}/detail/"
    
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Jawaban'
        context['question'] =  self.get_instance_questions(self.kwargs['question_id'])
        return context

    def form_valid(self, form):
        form.instance.question = self.get_instance_questions(self.kwargs['question_id'])
        form.instance.author = self.request.user
        form.save()
        messages.success(self.request, "Berhasil dijawab")
        return super().form_valid(form)

   