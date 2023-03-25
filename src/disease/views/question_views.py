from django.shortcuts import get_object_or_404
from django.views.generic import (
    ListView,
    DetailView,
    CreateView
)
from django.views import View
from django.urls import reverse_lazy
from disease.forms.disqus_form import QuestionForm
from disease.models.disqus_model import Answer, Question
from disease.models.news_model import News
from disease.models.references_model import *
from helper.permission import LoginAdminRequiredMixin
from django.contrib import messages

class QuestionDiseasesListView(ListView):
    model = Question
    context_object_name = 'questions'
    template_name = "disqus/question/list.html"

    def get_instance_diseases(self, diseases):
        return get_object_or_404(Disease, slug=diseases)
    
    def get_queryset(self):
        instance_diseases = self.get_instance_diseases(self.kwargs['diseases'])
        return Question.objects.filter(status=StatusChoice.APROVED, diseases=instance_diseases).order_by('created_at')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Pertanyaan Terkait'
        context['diseases'] =  self.get_instance_diseases(self.kwargs['diseases'])
        return context
   
class QuestionDiseasesCreateView(LoginAdminRequiredMixin, CreateView):
    model = Question
    form_class = QuestionForm
    context_object_name = 'question'
    template_name = "disqus/question/create.html"

    def get_success_url(self) -> str:
        instance_diseases = self.get_instance_diseases(self.kwargs['diseases']).slug
        return f'/page/diseases/{instance_diseases}/'

    def get_instance_diseases(self, diseases):
        return get_object_or_404(Disease, slug=diseases)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Ajukan Pertanyan'
        context['diseases'] =  self.get_instance_diseases(self.kwargs['diseases'])
        return context
    
    def form_valid(self, form):
        form.instance.diseases = self.get_instance_diseases(self.kwargs['diseases'])
        form.instance.user = self.request.user
        form.save()
        messages.success(self.request, "Pertanyaan berhasil dikirim.. Menunggu validasi dari editor")
        return super().form_valid(form)

class QuestionCreateView(LoginAdminRequiredMixin, CreateView):
    model = Question
    form_class = QuestionForm
    context_object_name = 'question'
    template_name = "disqus/question/create.html"

    def get_success_url(self):
        return "/"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Ajukan Pertanyan'
        return context
    
    def form_valid(self, form):
        form.instance.user = self.request.user
        form.save()
        messages.success(self.request, "Pertanyaan berhasil dikirim.. Menunggu validasi dari editor")
        return super().form_valid(form)    

class QuestionDiseasesAnswerDetailView(DetailView):
    model = Question
    context_object_name = 'question'
    template_name = "disqus/question/answer.html"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Ajukan Pertanyan'
        context['answer'] =  Answer.objects.filter(question=self.get_object())
        return context
    
