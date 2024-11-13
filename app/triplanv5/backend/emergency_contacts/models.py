from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()

class EmergencyContact(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="emergency_contacts")
    name = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=20)
    relationship = models.CharField(max_length=50)

    def __str__(self):
        return f"{self.name} ({self.relationship})"