# itineraries/views.py
from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import generics
from .models import Itinerary
from .serializers import ItinerarySerializer

class ItineraryListCreateView(generics.ListCreateAPIView):
    queryset = Itinerary.objects.all()
    serializer_class = ItinerarySerializer

class ItineraryDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Itinerary.objects.all()
    serializer_class = ItinerarySerializer

def home(request):
    return HttpResponse("Welcome to Triplan!")