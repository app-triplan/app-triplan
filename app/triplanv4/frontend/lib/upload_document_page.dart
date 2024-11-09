import 'package:flutter/material.dart';

class UploadDocumentPage extends StatefulWidget {
  const UploadDocumentPage({super.key});

  @override
  _UploadDocumentPageState createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {
  String? selectedType;
  final List<String> types = ['Hotel Stay', 'Travel Tickets', 'Activity', 'Visa', 'Rentals'];
  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Show the bottom sheet as soon as the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showUploadDocumentBottomSheet();
    });
  }

  void _showUploadDocumentBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Upload Document', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Type'),
                value: selectedType,
                items: types.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedType = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'File (PDF, JPG, JPEG)',
                  suffixIcon: Icon(Icons.attach_file),
                ),
                readOnly: true,
                onTap: () {
                  // Implement file picker functionality here
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: notesController,
                decoration: const InputDecoration(labelText: 'Notes'),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement save functionality
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Document uploaded successfully!')),
                  );
                },
                child: const Text('Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Document'),
      ),
      body: const Center(
        child: Text('Upload Document Page'),
      ),
    );
  }
}