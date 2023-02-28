# accounts.authentication
import jwt
from rest_framework.authentication import BaseAuthentication
from django.middleware.csrf import CsrfViewMiddleware
from rest_framework import exceptions
from django.conf import settings
from django.contrib.auth import get_user_model
from django.utils.translation import gettext_lazy as _
from rest_framework.authtoken.models import Token



class SafeJWTAuthentication(BaseAuthentication):
    '''
        custom authentication class for DRF and JWT
        https://github.com/encode/django-rest-framework/blob/master/rest_framework/authentication.py
    '''

    def authenticate(self, request):
        User = get_user_model()
        authorization_header = request.headers.get('Authorization')        

        if not authorization_header:
            return None
        
        access_token = authorization_header.split(' ')[1]
        if authorization_header.split(' ')[0] == "Key":
            return self.validate_key(access_token)
        
        try:
            if authorization_header.split(' ')[0] != "Token":
                raise exceptions.AuthenticationFailed("Token missing")
            payload = jwt.decode(
                access_token, settings.SECRET_KEY, algorithms=['HS256']
            )

        except jwt.ExpiredSignatureError as e:
            raise exceptions.AuthenticationFailed('access_token expired') from e
        except IndexError as e:
            raise exceptions.AuthenticationFailed('Token prefix missing') from e
        except jwt.DecodeError as e:
            raise exceptions.AuthenticationFailed('Signature verification failed') from e

        user = User.objects.filter(id=payload['user_id']).first()
        if user is None:
            raise exceptions.AuthenticationFailed('User not found')

        if not user.is_active:
            raise exceptions.AuthenticationFailed('user is inactive')

        # self.enforce_csrf(request)
        print(user)
        return (user, None)