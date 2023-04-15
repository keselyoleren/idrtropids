from rest_framework import serializers

from disease.models.references_model import Article
from disease.serializer.category import CategorySerializer


class ArticleSerializer(serializers.ModelSerializer):
    category = CategorySerializer()
    class Meta:
        model = Article
        exclude = ("content",)


class GetArticleSerialize(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = "__all__"

