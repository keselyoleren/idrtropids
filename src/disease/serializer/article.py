from rest_framework import serializers

from disease.models.references import Article


class ArticleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        exclude = ("abstract",)


class GetArticleSerialize(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = "__all__"

