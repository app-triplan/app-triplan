import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000/api';

  Future<String?> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/token/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['access']; // Return the access token
    } else {
      return null; // Login failed
    }
  }

  Future<bool> resetPassword(String email) async {
    final url = Uri.parse('$baseUrl/password-reset/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      return true; // Password reset request was successful
    } else {
      print('Failed to send password reset email: ${response.body}');
      return false; // Password reset request failed
    }
  }

  Future<bool> register(String username, String email, String password) async {
    final url = Uri.parse('$baseUrl/register/'); // Update endpoint if needed
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return true; // Registration successful
    } else {
      print('Failed to register. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to register');
    }
  }

  Future<List<dynamic>> fetchExpenses(String token) async {
    final url = Uri.parse('$baseUrl/expenses/');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Failed to load expenses. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load expenses');
    }
  }

  Future<void> addExpense(String token, String title, double amount, int itineraryId, DateTime date) async {
    final url = Uri.parse('$baseUrl/expenses/');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'title': title,
        'amount': amount,
        'itinerary': itineraryId,
        'date': DateFormat('yyyy-MM-dd').format(date),
      }),
    );

    if (response.statusCode != 201) {
      print('Failed to add expense. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to add expense');
    }
  }
}