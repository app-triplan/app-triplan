from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path, include
from itineraries.views import home  # Importing the home view directly
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home, name='home'),  # Root URL to display the home page
    path('users/', include('users.urls')),  # Users app URLs under /users/
    path('api/documents/', include('documents.urls')),  # Documents app under /api/documents/
    path('api/expenses/', include('expenses.urls')),  # Expenses app under /api/expenses/
    path('api/emergency-contacts/', include('emergency_contacts.urls')),  # Emergency contacts under /api/emergency-contacts/
    path('api/itineraries/', include('itineraries.urls')),  # Itineraries endpoints under /api/itineraries/
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),  # Get tokens
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),  # Refresh token
    path('api/token/verify/', TokenVerifyView.as_view(), name='token_verify'),  # Verify token
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)