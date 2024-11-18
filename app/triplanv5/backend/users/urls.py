from django.urls import path
from .views import UserProfileView, RegisterView, PasswordResetView

urlpatterns = [
    path('profile/', UserProfileView.as_view(), name='user_profile'),
    path('register/', RegisterView.as_view(), name='register'),
    path('password-reset/', PasswordResetView.as_view(), name='password_reset'),  # Password reset endpoint
]