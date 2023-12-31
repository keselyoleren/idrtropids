from dataclasses import fields
from rest_framework import serializers
from disease.models.diseases_model import Disease
from disease.models.news_model import News
from disease.serializer.category import CategorySerializer
from disease.serializer.news import NewsSerializer
from users.serializers.user import UserSerialize
from django.conf import settings

class DiseaseSerialize(serializers.ModelSerializer):
    news = serializers.SerializerMethodField()
    
    class Meta:
        model = Disease
        fields = ('id', 'disease_name', 'disease_prevention', 'description', 'medicine', 'diagnose', 'lab_check', 'cause_of_disease', 'news')

    def get_news(self, obj):
        instance = News.objects.filter(disease=obj)
        return NewsSerializer(instance, many=True).data


class DiseasesSerializer(serializers.ModelSerializer):
    created_by = UserSerialize(many=False)
    category = CategorySerializer()
    class Meta:
        model = Disease
        exclude = ('content',)

class GetDiseasesSerialize(serializers.ModelSerializer):
    class Meta:
        model = Disease
        fields = ('id', 'disease_name')

class GetDiseasesRetriveSerialize(serializers.ModelSerializer):
    created_by = UserSerialize(many=False)
    category = CategorySerializer()
    thumbnail = serializers.SerializerMethodField()
    
    class Meta:
        model = Disease
        fields = "__all__"

    def get_thumbnail(self, obj):
        return f"{settings.APP_URL}{obj.thumbnail.url}"
