from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import generics, permissions
from .models import Itinerary
from .serializers import ItinerarySerializer

class ItineraryListCreateView(generics.ListCreateAPIView):
    queryset = Itinerary.objects.all()
    serializer_class = ItinerarySerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)  # Link the itinerary to the logged-in user

class ItineraryDetailView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ItinerarySerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return Itinerary.objects.filter(user=self.request.user)  # Limit to the user's itineraries

def home(request):
    return HttpResponse("Welcome to Triplan!")