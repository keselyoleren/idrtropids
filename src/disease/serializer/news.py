from rest_framework import serializers

from disease.models.news import News


class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = News
        exclude = ('content', )

class RetriveNewsSerialize(serializers.ModelSerializer):
    class Meta:
        model = News
        fields = "__all__"
        