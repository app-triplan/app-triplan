from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import get_user_model
from .serializers import UserSerializer

User = get_user_model()

class UserProfileView(APIView):
    def get(self, request, *args, **kwargs):
        user = request.user  # assumes user is authenticated
        serializer = UserSerializer(user)
        return Response(serializer.data, status=status.HTTP_200_OK)