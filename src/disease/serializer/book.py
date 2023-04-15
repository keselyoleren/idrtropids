from rest_framework import serializers

from disease.models.references_model import Article, Book
from disease.serializer.category import CategorySerializer
from django.conf import settings


class BookSerializer(serializers.ModelSerializer):
    category = CategorySerializer()
    class Meta:
        model = Book
        exclude = ("content", )

class BookRetriefSerialize(serializers.ModelSerializer):
    category = CategorySerializer()
    thumbnail = serializers.SerializerMethodField()
    
    class Meta:
        model = Book
        fields = "__all__"

    def get_thumbnail(self, obj):
        return f"{settings.APP_URL}{obj.thumbnail.url}"

