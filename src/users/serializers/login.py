
from django.contrib.auth import authenticate
from requests.api import request
from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

from django.utils.translation import gettext_lazy as _
from django.utils import translation

from users.models import UserAccount



class CustomTokenObtaiPairSerializer(TokenObtainPairSerializer):

    def validate(self, attrs):
        credentials = {
            'email': '',
            'password': attrs.get("password")
        }

        if user_obj := UserAccount.objects.filter(email=attrs.get("email")).first() or UserAccount.objects.filter(username=attrs.get("email")).first():
            credentials['email'] = user_obj.username

        response = super().validate(credentials)

        response["user"] = {
            "name": f"{self.user.first_name}",
            "email": self.user.email,
            "last_login": self.user.last_login,
            "is_active": self.user.is_active,
        }
        return response


class LoginSerialize(serializers.Serializer):
    email = serializers.CharField(required=False, allow_blank=True)
    password = serializers.CharField(style={'input_type': 'password'}, allow_blank=True)

    def authenticate(self, **kwargs):
        return authenticate(self.context['request'], **kwargs)

    def validate_email(self, value):
        if not value:
            raise serializers.ValidationError(_('Email is required..!'))
        return value

    def validate_password(self, value):
        if not value:
            raise serializers.ValidationError(_('Password is required..!'))
        return value