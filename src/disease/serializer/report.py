from rest_framework import serializers
from disease.models.references_model import Report
from disease.serializer.category import CategorySerializer
from disease.serializer.keyword import KeywordSerialize
from django.conf import settings


class ReportSerializer(serializers.ModelSerializer):
    category = CategorySerializer()
    class Meta:
        model = Report
        exclude = ("content", )

class GetReportSerialize(serializers.ModelSerializer):
    keyword = KeywordSerialize(many=True)
    category = CategorySerializer()
    thumbnail = serializers.SerializerMethodField()
    
    
    class Meta:
        model = Report
        fields = "__all__"

    def get_thumbnail(self, obj):
        return f"{settings.APP_URL}{obj.thumbnail.url}"
