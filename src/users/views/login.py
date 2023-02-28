from datetime import datetime

from django.contrib.auth.models import User
from django.db.models.query import Q

from rest_framework import (
    exceptions,
    generics,
    status,
    response
)
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from users.models import UserAccount
from rest_framework.authtoken.models import Token
from django.contrib.auth import authenticate
from django.conf import settings
from django.contrib.auth.views import LoginView


from users.serializers.login import GoogleSocialAuthSerializer, LoginForm, LoginSerialize

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
        return Response(data, status=status.HTTP_200_OK)

class UserLoginView(LoginView):
    template_name = 'users/login.html'
    form_class = LoginForm


class LoginApiView(generics.CreateAPIView):
    serializer_class = LoginSerialize

    def get_tokens_for_user(self, user):
        refresh = RefreshToken.for_user(user)
        return str(refresh), str(refresh.access_token)

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
        

        token, created = Token.objects.get_or_create(user=user)


        resp =  {
            'token': token.key, 
            'email': user.email, 
            'username': user.username, 
        }
        return response.Response(resp)

