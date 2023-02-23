from django import views
from django.conf import settings
from rest_framework_simplejwt.authentication import JWTTokenUserAuthentication
from rest_framework_simplejwt.exceptions import TokenError
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework import (
    status,
    views
)
from rest_framework.authtoken.models import Token


class LogoutAPIviewset(views.APIView):
    permission_classes =  [IsAuthenticated]
    def post(self, request, *args, **kwargs):
        token = Token.objects.get(user=request.user)
        token.delete()
        return Response(status=204)
        