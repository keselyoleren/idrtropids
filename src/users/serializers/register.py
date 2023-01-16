from rest_framework import serializers
from django.contrib.auth.models import User
from django.conf import settings
from django.utils.translation import gettext_lazy as _


class ResendActivationSerializer(serializers.Serializer):
    email = serializers.EmailField(required=True)

    def validate(self, attrs):
        return super().validate(attrs)


class RegisterSerialize(serializers.Serializer):
    email = serializers.EmailField(required=False, allow_blank=True)
    password = serializers.CharField(required=False, allow_blank=True)
    full_name = serializers.CharField(required=False, allow_blank=True)

    class Meta:
        model = User
        fields = "__all__"

    def validate_full_name(self, value):
        if not value:
            raise serializers.ValidationError(_('Full name is required..!'))

    def validate_email(self, value):
        if not value:
            raise serializers.ValidationError(_('Email is required..!'))
        if User.objects.filter(email=value).exists():
            raise serializers.ValidationError(_("Email already exists.!"))
        if User.objects.filter(username=value).exists():
            raise serializers.ValidationError(_("Username / Email already exists.!"))
        return value
        

    def validate_password(self, value):
        if not value:
            raise serializers.ValidationError(_('Password is required..!'))

        if len(value) < getattr(settings, 'PASSWORD_MIN_LENGTH', 8):
            raise serializers.ValidationError(
                _("Password should be atleast 8 characters long.")
            )
        return value
