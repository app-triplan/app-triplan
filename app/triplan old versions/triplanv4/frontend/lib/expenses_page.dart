import 'package:flutter/material.dart';
import 'api_service.dart';
import 'package:intl/intl.dart';

class ExpensesPage extends StatefulWidget {
  final String token;

  ExpensesPage({required this.token});

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final ApiService apiService = ApiService();
  List<dynamic> expenses = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchExpenses();
  }

  Future<void> fetchExpenses() async {
    try {
      final fetchedExpenses = await apiService.fetchExpenses(widget.token);
      setState(() {
        expenses = fetchedExpenses;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  Future<void> _addExpense() async {
    String title = '';
    double? amount;
    int itineraryId = 1; // Replace with appropriate itinerary ID
    DateTime? selectedDate;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Expense'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  amount = double.tryParse(value);
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    selectedDate == null
                        ? 'Select Date'
                        : 'Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}',
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                    child: const Text('Pick Date'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (title.isNotEmpty && amount != null && selectedDate != null) {
                  Navigator.pop(context);
                  try {
                    await apiService.addExpense(
                      widget.token,  // Pass the token here
                      title,
                      amount!,
                      itineraryId,
                      selectedDate!,
                    );
                    fetchExpenses(); // Refresh the expenses list after adding
                  } catch (e) {
                    print('Error adding expense: $e');
                  }
                } else {
                  print("Please fill all fields.");
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : expenses.isEmpty
              ? const Center(child: Text('No expenses found.'))
              : ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    final expense = expenses[index];
                    return ListTile(
                      title: Text(expense['title'] ?? 'No Title'),
                      subtitle: Text('Amount: ${expense['amount']}'),
                      trailing: Text(expense['date'] ?? 'No Date'),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExpense,
        child: const Icon(Icons.add),
      ),
    );
  }
}