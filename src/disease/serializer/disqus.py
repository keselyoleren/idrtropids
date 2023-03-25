from csv import excel
from dataclasses import fields
from rest_framework import serializers

from disease.models.disqus_model import Answer, Question
from users.serializers.user import UserSerialize


class QuestionSerialize(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = "__all__"

class QuestionReadOnlySerialize(serializers.ModelSerializer):
    user = UserSerialize()
    class Meta:
        model = Question
        exclude = ['asign_to', 'is_validate', 'status', 'parent']

class AnswerSerialize(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = "__all__"

class AnswerReadonlySerialize(serializers.ModelSerializer):
    author = UserSerialize()
    class Meta:
        model = Answer
        exclude = ['question', ]
