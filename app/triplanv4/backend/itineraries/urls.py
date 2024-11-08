# itineraries/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.ItineraryListCreateView.as_view(), name='itinerary-list'),
    path('<int:pk>/', views.ItineraryDetailView.as_view(), name='itinerary-detail'),
]