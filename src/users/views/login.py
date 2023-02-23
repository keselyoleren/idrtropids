from datetime import datetime

from django.contrib.auth.models import User
from django.db.models.query import Q

from rest_framework import (
    exceptions,
    generics,
    status,
)
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from users.models import UserAccount
from rest_framework.authtoken.models import Token
from django.contrib.auth import authenticate
from django.conf import settings


from users.serializers.login import GoogleSocialAuthSerializer, LoginSerialize

class GoogleSocialAuthView(generics.GenericAPIView):

    serializer_class = GoogleSocialAuthSerializer

    def list(self):
        pass
    
    def post(self, request):
        """

        POST with "auth_token"

        Send an idtoken as from google to get user information

        """

        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        data = ((serializer.validated_data)['auth_token'])
        new_user = authenticate(email=data['email'], password=settings.SOCIAL_SECRET)
        return Response(data, status=status.HTTP_200_OK)


class LoginApiView(generics.CreateAPIView):
    serializer_class = LoginSerialize

    def post(self, request, *args, **kwargs):
        param = self.serializer_class(data=request.data)
        param.is_valid(raise_exception=True)
        
        user = UserAccount.objects.filter(
            Q(username=param.data['email']) |
            Q(email=param.data['email'])
        ).first()

        if user is None:
            raise exceptions.AuthenticationFailed(
                "Unable to log in with provided credentials.")

        if not user.check_password(param.data['password']):
            raise exceptions.AuthenticationFailed(
                "Unable to log in with provided credentials.")

        
        user.last_login = datetime.now()
        user.save()
        # token = RefreshToken.for_user(user)
        token, created = Token.objects.get_or_create(user=user)
        response = self.response(
            request, user, token=token)
        return Response(response, status=status.HTTP_200_OK)

    def response(self, request, user, token=None):
        return {
            # 'access': None if token is None else str(token.access_token), 
            # 'refresh': None if token is None else str(token), 
            'token':str(token),
            "user": {
                "username": f"{user.username}", 
                "email": user.email, 
                "last_login": user.last_login, 
                "is_active": user.is_active
            }
        }

