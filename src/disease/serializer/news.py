from rest_framework import serializers

from disease.models.news_model import News
from disease.serializer.category import CategorySerializer
from disease.serializer.keyword import KeywordSerialize
from users.serializers.user import UserSerialize


class NewsSerializer(serializers.ModelSerializer):
    category = CategorySerializer()
    keyword = KeywordSerialize(many=True)
    created_by = UserSerialize(many=False)
    class Meta:
        model = News
        exclude = ('content', )

class GetNewsSerialize(serializers.ModelSerializer):
    keyword = KeywordSerialize(many=True)
    created_by = UserSerialize(many=False)
    category = CategorySerializer()
    class Meta:
        model = News
        fields = "__all__"
        