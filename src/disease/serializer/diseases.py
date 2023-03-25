from dataclasses import fields
from rest_framework import serializers
from disease.models.diseases_model import Disease
from disease.models.news_model import News
from disease.serializer.news import NewsSerializer
from users.serializers.user import UserSerialize

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
    class Meta:
        model = Disease
        exclude = ('content',)

class GetDiseasesRetriveSerialize(serializers.ModelSerializer):
    created_by = UserSerialize(many=False)
    class Meta:
        model = Disease
        fields = "__all__"