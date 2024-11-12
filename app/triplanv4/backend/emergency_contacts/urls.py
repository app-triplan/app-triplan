from django.urls import path
from .views import EmergencyContactListCreateView

urlpatterns = [
    path('', EmergencyContactListCreateView.as_view(), name='emergencycontact-list-create'),  # /api/emergency-contacts/ for list and create
]