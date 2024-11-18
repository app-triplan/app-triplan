import 'package:flutter/material.dart';
import 'api_service.dart'; // Ensure this points to your API service file

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final ApiService apiService = ApiService();
  bool isLoading = false;
  String? message;

  Future<void> resetPassword() async {
    setState(() {
      isLoading = true;
      message = null; // Reset the message
    });

    try {
      final success = await apiService.resetPassword(emailController.text);
      if (success) {
        setState(() {
          message = 'Password reset email sent successfully.';
        });
      } else {
        setState(() {
          message = 'Failed to send password reset email. Try again.';
        });
      }
    } catch (e) {
      setState(() {
        message = 'An error occurred. Please try again.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your email to reset your password.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            if (isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: resetPassword,
                child: const Text('Reset Password'),
              ),
            const SizedBox(height: 20),
            if (message != null)
              Text(
                message!,
                style: TextStyle(
                  color: message == 'Password reset email sent successfully.'
                      ? Colors.green
                      : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}