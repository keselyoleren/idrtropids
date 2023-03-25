
from dataclasses import field
from django.contrib.auth import authenticate
from requests.api import request
from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

from django.utils.translation import gettext_lazy as _
from django.utils import translation

from users.models import Profile, UserAccount


class ProfileSerialize(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ['id', 'full_name', 'profile_pic']


class UserSerialize(serializers.ModelSerializer):
    profile = serializers.SerializerMethodField()
    
    class Meta:
        model = UserAccount
        fields = ('id', 'username', 'email', 'profile')

    def get_profile(self, obj):
        instance_profile = Profile.objects.get(user=obj)
        return ProfileSerialize(instance_profile).data