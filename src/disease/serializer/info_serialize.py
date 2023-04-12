from rest_framework import serializers
from disease.models.references_model import Report
from disease.serializer.keyword import KeywordSerialize
from disease.models.diseases_model import Category
from home.models import Info

class ListInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Info
        fields = ('id', 'title')

class DetailinfoSerialize(serializers.ModelSerializer):
    class Meta:
        model = Info
        fields = "__all__"
