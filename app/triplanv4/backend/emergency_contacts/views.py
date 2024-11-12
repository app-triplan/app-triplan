from rest_framework import generics
from .models import EmergencyContact
from .serializers import EmergencyContactSerializer

class EmergencyContactListCreateView(generics.ListCreateAPIView):
    queryset = EmergencyContact.objects.all()
    serializer_class = EmergencyContactSerializer