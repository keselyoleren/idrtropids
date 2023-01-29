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

from users.serializers.login import LoginSerialize

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
        token = RefreshToken.for_user(user)
        response = self.response(
            request, user, token=token)
        return Response(response, status=status.HTTP_200_OK)

    def response(self, request, user, token=None):
        return {
            'access': None if token is None else str(token.access_token), 
            'refresh': None if token is None else str(token), 
            "user": {
                "username": f"{user.username}", 
                "email": user.email, 
                "last_login": user.last_login, 
                "is_active": user.is_active
            }
        }

