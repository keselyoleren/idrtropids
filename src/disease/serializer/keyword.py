from rest_framework import serializers

from disease.models.news_model import Keyword

class KeywordSerialize(serializers.ModelSerializer):
    class Meta:
        model = Keyword
        exclude = ("created_at",'updated_at' )

