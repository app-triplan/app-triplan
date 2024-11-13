from django.contrib.auth.models import AbstractUser
from django.db import models

class User(AbstractUser):
    membership_date = models.DateField(null=True, blank=True)

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    profile_picture = models.ImageField(upload_to='profile_pictures/', blank=True, null=True)