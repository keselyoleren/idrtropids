from rest_framework import serializers

from disease.models.news import News
from disease.serializer.keyword import KeywordSerialize
from users.serializers.user import UserSerialize


class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = News
        exclude = ('content', )

class RetriveNewsSerialize(serializers.ModelSerializer):
    keyword = KeywordSerialize(many=True)
    author = UserSerialize(many=False)
    class Meta:
        model = News
        fields = "__all__"
        