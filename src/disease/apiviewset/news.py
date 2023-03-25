from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)

from disease.models.news_model import News
from disease.serializer.news import GetNewsSerialize, NewsSerializer
from helper.pagination import ResponsePagination

class NewsApiView(generics.ListAPIView, generics.RetrieveAPIView, viewsets.ModelViewSet):
    serializer_class = NewsSerializer
    queryset = News.objects.all()
    pagination_class = ResponsePagination
    
    def get_permissions(self):
        if self.action in ['list', 'retrieve']:
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.visits += 1
        instance.save()
        serialize = GetNewsSerialize(instance).data
        return response.Response(serialize)