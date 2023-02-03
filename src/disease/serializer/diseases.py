from rest_framework import serializers
from disease.models.diseases import Disease
from disease.models.news import News
from disease.serializer.news import NewsSerializer

class DiseaseSerialize(serializers.ModelSerializer):
    news = serializers.SerializerMethodField()
    
    class Meta:
        model = Disease
        fields = ('id', 'disease_name', 'disease_prevention', 'description', 'medicine', 'diagnose', 'lab_check', 'cause_of_disease', 'news')

    def get_news(self, obj):
        instance = News.objects.filter(disease=obj)
        return NewsSerializer(instance, many=True).data
    