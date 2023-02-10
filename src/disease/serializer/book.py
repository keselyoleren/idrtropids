from dataclasses import field
from rest_framework import serializers

from disease.models.references import Article, Book


class BookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Book
        exclude = ("abstract", )

class BookRetriefSerialize(serializers.ModelSerializer):
    class Meta:
        model = Book
        fields = "__all__"

