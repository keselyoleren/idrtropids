from django.conf import settings
from rest_framework_simplejwt.authentication import JWTTokenUserAuthentication
from rest_framework_simplejwt.exceptions import TokenError
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework import (
    status,
    generics,
)

class LogoutJWTViewsets(generics.GenericAPIView):
    permission_classes =  [IsAuthenticated]
    authentication_classes = (JWTTokenUserAuthentication, )
    def post(self, request, *args, **kwargs):
        try:
            token  = RefreshToken(request.data['refresh'])
            token.blacklist()
            return Response({
                "detail": "Logout successfully."
            }, status=status.HTTP_200_OK)
        except TokenError as e:
            return Response({
                "detail": str(e)
            }, status=status.HTTP_400_BAD_REQUEST)
