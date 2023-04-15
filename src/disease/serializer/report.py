from rest_framework import serializers
from disease.models.references_model import Report
from disease.serializer.category import CategorySerializer
from disease.serializer.keyword import KeywordSerialize


class ReportSerializer(serializers.ModelSerializer):
    category = CategorySerializer()
    class Meta:
        model = Report
        exclude = ("content", )

class GetReportSerialize(serializers.ModelSerializer):
    keyword = KeywordSerialize(many=True)
    class Meta:
        model = Report
        fields = "__all__"

