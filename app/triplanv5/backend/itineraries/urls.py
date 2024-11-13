# itineraries/urls.py
from django.urls import path
from .views import ItineraryListCreateView, ItineraryDetailView

urlpatterns = [
    path('', ItineraryListCreateView.as_view(), name='itinerary-list-create'),  # /itineraries/ for list and create
    path('<int:pk>/', ItineraryDetailView.as_view(), name='itinerary-detail'),   # /itineraries/<id>/ for details
]