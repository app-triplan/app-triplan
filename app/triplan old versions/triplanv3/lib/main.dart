import 'package:flutter/material.dart';
import 'itinerary_screen.dart';
import 'trip_card.dart';
import 'documents.dart';
import 'contacts_screen.dart';
import 'create_new_trip_page.dart';
import 'profile_page.dart';
import 'paris_trip_details_page.dart';
import 'upload_document_page.dart';
import 'add_contact.dart';
import 'expenses_page.dart';

void main() {
  runApp(TriplanApp());
}

class TriplanApp extends StatelessWidget {
  const TriplanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triplan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _currentFilter = 'Upcoming';

  final List<String> _screenTitles = [
    'Dashboard',
    'Itineraries',
    'Documents',
    'Contacts',
    'Expenses'
  ];

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      HomeScreenContent(onNavigateToItinerary: _onNavigateToItinerary),
      ItineraryScreen(showAllTrips: true, initialFilter: _currentFilter),
      DocumentsScreen(),
      ContactsScreen(),
      ExpensesScreen()
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNavigateToItinerary(int index, String filter) {
    setState(() {
      _selectedIndex = index;
      _currentFilter = filter;
      _screens[1] = ItineraryScreen(showAllTrips: true, initialFilter: _currentFilter);
    });
  }

  void _showInfo(BuildContext context) {
  String infoContent;
  switch (_selectedIndex) {
    case 0: // Dashboard
      infoContent = '''
Navigate upcoming and past trips.
Use the "View All" button to see more trips.
      ''';
      break;
    case 1: // Itineraries
      infoContent = '''
Add a new trip using the + icon.
Toggle between upcoming and past trips.
Select Tokyo trip and add activities to create an itinerary.
      ''';
      break;
    case 2: // Documents
      infoContent = '''
Upload new documents using the + icon.
Organize and manage your travel documents efficiently.
      ''';
      break;
    case 3: // Contacts
      infoContent = '''
Add emergency contacts using the + icon.
Click on 📍 to share your location.
View and manage your contact list.
      ''';
      break;
    case 4: // Expenses
      infoContent = '''
Add new expenses using the + icon.
Select trip to view filtered expenses.
Monitor your total expense and budget progress.
      ''';
      break;
    default:
      infoContent = '';
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(_screenTitles[_selectedIndex] + ' - Info'),
        content: Text(infoContent),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
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
        title: Text(_screenTitles[_selectedIndex]),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => _showInfo(context),
          ),
          if (_selectedIndex == 1)
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateNewTripPage()),
                );
              },
            ),
          if (_selectedIndex == 2)
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadDocumentPage()),
                );
              },
            ),
          if (_selectedIndex == 3)
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddContactPage()),
                );
              },
            ),
          if (_selectedIndex == 4)
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Add New Expense',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          // Add form fields here for new expense
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Add Expense'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              margin: const EdgeInsets.only(bottom: 0),
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Create Itinerary'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateNewTripPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.upload_file),
              title: const Text('Upload Documents'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadDocumentPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.place),
              title: const Text('View Saved Places'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Itinerary'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Documents'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Expenses')
        ],
      ),
    );
  }
}

// HomeScreenContent shows the first trip only
class HomeScreenContent extends StatelessWidget {
  final Function(int, String) onNavigateToItinerary;

  const HomeScreenContent({super.key, required this.onNavigateToItinerary});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Upcoming Trips', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ParisTripDetailsPage()),
              );
            },
            child: const TripCard(title: 'Paris', date: 'Dec 10-15', imagePath: 'assets/paris.jpg'),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                onNavigateToItinerary(1, 'Upcoming');
              },
              child: const Text('View All'),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Past Trips', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const TripCard(title: 'Vietnam', date: 'Sep 1-5', imagePath: 'assets/vietnam.jpg'),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                onNavigateToItinerary(1, 'Past');
              },
              child: const Text('View All'),
            ),
          ),
        ],
      ),
    );
  }
}