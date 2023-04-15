from rest_framework import serializers

from disease.models.news_model import News
from disease.serializer.category import CategorySerializer
from disease.serializer.keyword import KeywordSerialize
from users.serializers.user import UserSerialize
from django.conf import settings


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
    thumbnail = serializers.SerializerMethodField()
    
    class Meta:
        model = News
        fields = "__all__"
    
    def get_thumbnail(self, obj):
        return f"{settings.APP_URL}{obj.thumbnail.url}"
