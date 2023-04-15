from rest_framework import serializers

from disease.models.references_model import Article
from disease.serializer.category import CategorySerializer
from django.conf import settings


class ArticleSerializer(serializers.ModelSerializer):
    category = CategorySerializer()
    class Meta:
        model = Article
        exclude = ("content",)


class GetArticleSerialize(serializers.ModelSerializer):
    category = CategorySerializer()
    thumbnail = serializers.SerializerMethodField()
    
    class Meta:
        model = Article
        fields = "__all__"

    def get_thumbnail(self, obj):
        return f"{settings.APP_URL}{obj.thumbnail.url}"


