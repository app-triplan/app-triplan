# triplan/urls.py
from django.contrib import admin
from django.urls import path, include
from itineraries.views import home  # Importing the home view directly

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('itineraries.urls')),  # Include itineraries URLs under /api/
    path('', home, name='home'),  # Root URL to display the home page
]