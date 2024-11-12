from rest_framework import serializers
from .models import Expense

class ExpenseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Expense
        fields = ['id', 'title', 'amount', 'itinerary', 'date', 'notes', 'user']
        read_only_fields = ['user']  # Prevent 'user' from being required in the API request

    def create(self, validated_data):
        validated_data['user'] = self.context['request'].user  # Automatically assign the user
        return super().create(validated_data)