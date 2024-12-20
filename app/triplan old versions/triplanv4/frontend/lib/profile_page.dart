import 'package:flutter/material.dart';
import 'login_page.dart';  // Import LoginPage

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _logout(BuildContext context) {
    // This will navigate to the LoginPage and clear the navigation stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Milan Gabriel',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            const Text(
              'Member Since: Sep 2024',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Co-Travellers:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildCoTravelerTile(context, 'Alice', 'Member Since Jan 2023', 3),
                  _buildCoTravelerTile(context, 'Bob', 'Member Since Mar 2022', 5),
                  _buildCoTravelerTile(context, 'Charlie', 'Member Since Jul 2021', 2),
                  _buildCoTravelerTile(context, 'David', 'Member Since Nov 2020', 4),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invite copied to clipboard!')),
                    );
                  },
                  child: const Text('Invite'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () => _logout(context),
                  child: const Text('Logout'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoTravelerTile(BuildContext context, String name, String userSince, int tripCount) {
    return ListTile(
      title: Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: Text(userSince, style: TextStyle(color: Colors.grey[600])),
      trailing: Text('Trips: $tripCount', style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: () {
        _showUserDetails(context, name, userSince, tripCount);
      },
    );
  }

  void _showUserDetails(BuildContext context, String name, String userSince, int tripCount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: Text('$userSince\nTrips taken together: $tripCount'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}