from dataclasses import field
from rest_framework import serializers

from disease.models.references_model import Article, Book
from disease.serializer.category import CategorySerializer


class BookSerializer(serializers.ModelSerializer):
    category = CategorySerializer()
    class Meta:
        model = Book
        exclude = ("content", )

class BookRetriefSerialize(serializers.ModelSerializer):
    category = CategorySerializer()
    class Meta:
        model = Book
        fields = "__all__"

