from rest_framework import serializers

from disease.models.references_model import Article


class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        exclude = ("abstract",)


class GetArticleSerialize(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = "__all__"

