from django.shortcuts import get_object_or_404
from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)
from disease.models.diseases_model import Disease
from disease.models.disqus_model import Answer, Question
from disease.serializer.disqus import AnswerReadonlySerialize, AnswerSerialize, QuestionReadOnlySerialize, QuestionSerialize
from helper.choices import StatusChoice
from helper.pagination import ResponsePagination


class AnswerApiView(viewsets.ModelViewSet):
    serializer_class = AnswerSerialize
    queryset = Answer.objects.all()
    pagination_class = ResponsePagination
        
    
    def get_queryset(self):
        question = get_object_or_404(Question, id=self.kwargs['question_id'])
        return super().get_queryset().filter(question=question).order_by('created_at')

    def get_permissions(self):
        if self.action in ['list', 'retrieve']:
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]
    
    def retrieve(self, request, *args, **kwargs):
        return super().retrieve(request, *args, **kwargs)
    
    def create(self, request, *args, **kwargs):
        data = request.data
        question = get_object_or_404(Question, id=kwargs['question_id'])
        data['author'] = request.user.id
        data['question'] = question.id
        serializer = self.serializer_class(data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        return response.Response(serializer.data, status=status.HTTP_201_CREATED)

    def update(self, request, *args, **kwargs):
        question = get_object_or_404(Question, id=kwargs['question_id'])
        data = request.data
        data['author'] = request.user.id
        data['question'] = question.id
        instance = self.get_object()
        serializer = self.serializer_class(instance, data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return response.Response(serializer.data)
    
    def destroy(self, request, *args, **kwargs):
        return super().destroy(request, *args, **kwargs)