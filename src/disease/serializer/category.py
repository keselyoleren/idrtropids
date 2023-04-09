from rest_framework import serializers
from disease.models.references_model import Report
from disease.serializer.keyword import KeywordSerialize
from disease.models.diseases_model import Category


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('id', 'name')

