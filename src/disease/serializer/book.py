from dataclasses import field
from rest_framework import serializers

from disease.models.references_model import Article, Book


class BookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Book
        exclude = ("content", )

class BookRetriefSerialize(serializers.ModelSerializer):
    class Meta:
        model = Book
        fields = "__all__"

