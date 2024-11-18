from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import PasswordResetForm
from django.core.mail import BadHeaderError
from django.http import HttpResponse
from .serializers import UserSerializer, RegisterSerializer

User = get_user_model()

class UserProfileView(APIView):
    def get(self, request, *args, **kwargs):
        user = request.user  # assumes user is authenticated
        serializer = UserSerializer(user)
        return Response(serializer.data, status=status.HTTP_200_OK)

class RegisterView(APIView):
    permission_classes = [AllowAny]  # Allow unauthenticated users
    def post(self, request, *args, **kwargs):
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "User registered successfully."}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class PasswordResetView(APIView):
    permission_classes = [AllowAny]  # Allow unauthenticated users

    def post(self, request, *args, **kwargs):
        email = request.data.get('email')
        if not email:
            return Response({"error": "Email is required"}, status=status.HTTP_400_BAD_REQUEST)

        password_reset_form = PasswordResetForm(data={"email": email})
        if password_reset_form.is_valid():
            try:
                password_reset_form.save(
                    from_email="no-reply@example.com",  # Replace with your sender email
                    request=request,
                )
                return Response({"message": "Password reset email sent."}, status=status.HTTP_200_OK)
            except BadHeaderError:
                return Response({"error": "Invalid header found."}, status=status.HTTP_400_BAD_REQUEST)
        return Response({"error": "Invalid email address."}, status=status.HTTP_400_BAD_REQUEST)