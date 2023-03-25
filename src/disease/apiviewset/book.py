from rest_framework import (
    status,
    generics,
    viewsets,
    permissions,
    views,
    response,
)
from disease.models.references_model import Book


from disease.serializer.book import BookRetriefSerialize, BookSerializer
from disease.serializer.news import NewsSerializer
from helper.pagination import ResponsePagination

class BookApiView(generics.ListAPIView, generics.RetrieveAPIView, viewsets.ModelViewSet):
    serializer_class = BookSerializer
    queryset = Book.objects.all()
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
        serialize = BookRetriefSerialize(instance).data
        return response.Response(serialize)