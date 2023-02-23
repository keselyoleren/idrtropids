
from django.contrib.auth import authenticate
from requests.api import request
from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

from django.utils.translation import gettext_lazy as _
from django.utils import translation
from helper.google import Google
from django.conf import settings
from users.models import UserAccount

class RegisterGoogle:

    def register_social_user(self, provider, user_id, email, name):
        filtered_user_by_email = UserAccount.objects.filter(email=email)
        if filtered_user_by_email.exists():
            registered_user = authenticate(
                email=email, password=settings.SOCIAL_SECRET)
            user = UserAccount.objects.get(email=email)
        else:
            user = {
                'username': email, 
                'email': email,
                'password': settings.SOCIAL_SECRET}

            user = UserAccount.objects.create_user(**user)
            new_user = authenticate(email=email, password=settings.SOCIAL_SECRET)
        return {
            'email': user.email, 
            'username': user.username, 
        }


class GoogleSocialAuthSerializer(serializers.Serializer):
    auth_token = serializers.CharField()

    def validate_auth_token(self, auth_token):
        user_data = Google.validate(auth_token)

        try:
            user_data['sub']
        except:
            raise serializers.ValidationError(
                'The token is invalid or expired. Please login again.'
            )
        
        user_id = user_data['sub']
        email = user_data['email']
        name = user_data['name']
        provider = 'google'

        return RegisterGoogle().register_social_user(provider=provider, 
                                                user_id=user_id, 
                                                email=email, 
                                                name=name
                                            )



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