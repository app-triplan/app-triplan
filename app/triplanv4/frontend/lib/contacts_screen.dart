import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  final List<Map<String, String>> contacts = const [
    {'name': 'Mom', 'phone': '+1 (555) 123-4567'},
    {'name': 'Dad', 'phone': '+1 (555) 234-5678'},
    {'name': 'Bro', 'phone': '+1 (555) 345-6789'},
    {'name': 'Bob the Friend', 'phone': '+1 (555) 456-7890'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.blue),
                      title: Text(contacts[index]['name'] ?? ''),
                      subtitle: Text(contacts[index]['phone'] ?? ''),
                      trailing: Wrap(
                        spacing: 12, // Adds space between the icons
                        children: [
                          IconButton(
                            icon: const Icon(Icons.phone, color: Colors.green),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Calling ${contacts[index]['name']}...')),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.location_on, color: Colors.red),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Sending location to ${contacts[index]['name']}...')),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}