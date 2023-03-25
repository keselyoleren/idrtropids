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
from disease.serializer.disqus import AnswerReadonlySerialize, QuestionReadOnlySerialize, QuestionSerialize
from helper.choices import StatusChoice
from helper.pagination import ResponsePagination


class QuestionApiView(viewsets.ModelViewSet):
    serializer_class = QuestionSerialize
    queryset = Question.objects.all()
    pagination_class = ResponsePagination
    # permission_classes = (permissions.IsAuthenticated, )


    
    def get_permissions(self):
        if self.action in ['list', 'retrieve']:
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]
        

    def get_serializer_class(self):
        if self.action == 'list':
            return QuestionReadOnlySerialize

    def get_queryset(self):
        return self.queryset.filter(status=StatusChoice.APROVED).order_by('created_at')
    
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance_answer = Answer.objects.filter(question=instance)
        answer = AnswerReadonlySerialize(instance_answer, many=True).data
        serializer = QuestionReadOnlySerialize(instance).data
        serializer['answers'] = answer
        return response.Response(serializer)

    def create(self, request, *args, **kwargs):
        data = request.data
        data['user'] = request.user.id
        serializer = self.serializer_class(data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        # instance = serializer.save()
        # to_response = QuestionReadOnlySerialize(instance).data
        return response.Response(serializer.data, status=status.HTTP_201_CREATED)

    def update(self, request, *args, **kwargs):
        data = request.data
        data['user'] = request.user.id
        instance = self.get_object()
        if instance.user != request.user:
            return response.Response({"message":"only author can edit this questions"}, status=status.HTTP_403_FORBIDDEN)

        serializer = self.serializer_class(instance, data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        resp = QuestionReadOnlySerialize(instance)
        return response.Response(resp.data)
    
    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()

        if instance.user != request.user:
            return response.Response({"message":"only author can delete this questions"}, status=status.HTTP_403_FORBIDDEN)
        return super().destroy(request, *args, **kwargs)