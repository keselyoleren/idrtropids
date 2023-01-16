
from django.urls import URLPattern, path, include
from rest_framework import routers
from django.contrib.auth import views as auth_views

from users.views.login import LoginApiView
from users.views.logout import LogoutJWTViewsets
from rest_framework_simplejwt.views import TokenRefreshView



urlpatterns = [
    path('login/', LoginApiView.as_view(), name="login"),
    path('refresh/token/',TokenRefreshView.as_view(), name="refresh_token"),
    path('logout/', LogoutJWTViewsets.as_view(), name="logout"),
    # path("password/reset/", password.ResetPasswordViewsets.as_view(), name=""),
    # path("password/reset/confirm/",
    #      password.ConfirmResetPasswordViewsets.as_view(), name=""),
    # path("password/change/", password.ChangePasswordViewSet.as_view(), name=""),
    # path('register/', register.RegisterAPIView.as_view(), name=""),
    # path('resend-activation/', register.ResendActivation.as_view(), name=""),
    # path("activate/<uidb64>/<token>/", user.ActiveUserViewset.as_view(), name=""),
]
