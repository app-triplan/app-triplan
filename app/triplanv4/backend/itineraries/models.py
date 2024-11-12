from django.db import models
from django.contrib.auth.models import User
from django.conf import settings


class Itinerary(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    destination = models.CharField(max_length=255)
    start_date = models.DateField()
    end_date = models.DateField()
    status = models.CharField(max_length=50, choices=[('planned', 'Planned'), ('completed', 'Completed')])

    def __str__(self):
        return f"{self.destination} ({self.start_date} - {self.end_date})"