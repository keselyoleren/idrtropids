from django.shortcuts import get_object_or_404
from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)
from disease.models.diseases import Disease
from disease.models.disqus import Answer, Question
from disease.serializer.disqus import AnswerReadonlySerialize, QuestionReadOnlySerialize, QuestionSerialize
from helper.pagination import ResponsePagination


class QuestionDiseasesApiView(generics.ListAPIView, generics.CreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView, viewsets.ModelViewSet):
    serializer_class = QuestionSerialize
    queryset = Question.objects.all()
    pagination_class = ResponsePagination
    permission_classes = (permissions.IsAuthenticated, )

    # def get_permissions(self):
    #     if self.request.method == 'GET':
    #         return [permissions.AllowAny(), ]
    #     return super().get_permissions()

    def list(self, request, *args, **kwargs):
        diseases = get_object_or_404(Disease, id=kwargs['diseases_id'])
        queryset = self.queryset.filter(diseases=diseases)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = QuestionReadOnlySerialize(page, many=True)
            return self.get_paginated_response(serializer.data)
        serializer = QuestionReadOnlySerialize(queryset, many=True)
        return response.Response(serializer.data)


    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance_answer = Answer.objects.filter(question=instance)
        answer = AnswerReadonlySerialize(instance_answer, many=True).data
        serializer = QuestionReadOnlySerialize(instance).data
        serializer['answers'] = answer
        return response.Response(serializer)

    def create(self, request, *args, **kwargs):
        diseases = get_object_or_404(Disease, id=kwargs['diseases_id'])
        data = request.data
        data['diseases'] = diseases.id
        data['user'] = request.user.id
        serializer = self.serializer_class(data=data)
        serializer.is_valid(raise_exception=True)
        instance = serializer.save()
        to_response = QuestionReadOnlySerialize(instance).data
        return response.Response(to_response, status=status.HTTP_201_CREATED)

    def update(self, request, *args, **kwargs):
        diseases = get_object_or_404(Disease, id=kwargs['diseases_id'])
        data = request.data
        data['diseases'] = diseases.id
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