
from dataclasses import field
from django.contrib.auth import authenticate
from requests.api import request
from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

from django.utils.translation import gettext_lazy as _
from django.utils import translation

from users.models import UserAccount



class UserSerialize(serializers.ModelSerializer):
    class Meta:
        model = UserAccount
        fields = ('id', 'username', 'email')