from rest_framework import serializers
from disease.models.references_model import Report
from disease.serializer.keyword import KeywordSerialize


class ReportSerializer(serializers.ModelSerializer):
    class Meta:
        model = Report
        exclude = ("abstract", 'content')

class GetReportSerialize(serializers.ModelSerializer):
    keyword = KeywordSerialize(many=True)
    class Meta:
        mdoel = Report
        fields = "__all__"
