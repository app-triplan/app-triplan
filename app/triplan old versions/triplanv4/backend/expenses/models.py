from django.db import models
from django.contrib.auth import get_user_model
from itineraries.models import Itinerary  # Assuming expenses relate to specific itineraries

User = get_user_model()

class Expense(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="expenses")
    itinerary = models.ForeignKey(Itinerary, on_delete=models.CASCADE, related_name="expenses")
    title = models.CharField(max_length=100)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateField()
    notes = models.TextField(blank=True, null=True)

    def __str__(self):
        return f"{self.title} - {self.amount}"