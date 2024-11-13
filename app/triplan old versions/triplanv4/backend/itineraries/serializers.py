from rest_framework import serializers
from .models import Itinerary

class ItinerarySerializer(serializers.ModelSerializer):
    class Meta:
        model = Itinerary
        fields = '__all__'  # Adjust this to include only specific fields if needed