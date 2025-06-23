// lib/main.dart
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fingerprint Auth App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // You can customize this
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.blueGrey[700]),
          hintStyle: TextStyle(color: Colors.blueGrey[400]),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            shadowColor: Colors.black.withOpacity(0.2),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
          ),
        ),
        useMaterial3: true, // Use Material 3 design
      ),
      // Set LoginPage as the initial screen
      home: const LoginPage(),
    );
  }
}

// NEW WIDGET: LoginPage
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showMessage(context, 'Please fill all fields.');
      return;
    }

    if (password != confirmPassword) {
      _showMessage(context, 'Password and confirm password do not match.');
      return;
    }

    // Simulate login success
    print('Login successful for user: $username');
    _showMessage(context, 'Login Successful! Redirecting...');

    // Navigate to SplashScreen, which then leads to HomePage on Sports tab
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SplashScreen()),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed to white
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 75, 75),
        title: const Text('Login to betPawa', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: SingleChildScrollView( // Allow scrolling for smaller screens
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/betpawa.png', // Path to your image
                width: 150, // Smaller for login page
                height: 150, // Smaller for login page
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.error,
                    size: 80,
                    color: Colors.red,
                  );
                },
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blueGrey), // Adjusted border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blueGrey), // Adjusted border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor), // Highlight on focus
                  ),
                  prefixIcon: const Icon(Icons.person, color: Colors.blueGrey), // Icon color
                  filled: true,
                  fillColor: Colors.grey[100], // Lighter fill color for input fields
                ),
                style: const TextStyle(color: Colors.black), // Input text color
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.blueGrey),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Re-enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.blueGrey),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 6, 75, 75), // Button background color
                  foregroundColor: Colors.white, // Button text color
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 1. Create a SplashScreen widget
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate some loading process, e.g., fetching data, initializing services
    Future.delayed(const Duration(seconds: 3), () {
      // After 3 seconds, navigate to the HomePage with selected index 1 (Sports)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage(initialIndex: 1)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your app logo from assets/betpawa.png
            Image.asset(
              'assets/betpawa.png', // Path to your image
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
              fit: BoxFit.contain, // Ensures the image fits within the bounds
              // You can add an errorBuilder here for debugging if the image path is incorrect
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.error,
                  size: 100,
                  color: Colors.red,
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Loading betPawa...',
              style: TextStyle(
                color: Color.fromARGB(255, 6, 75, 75), // Changed text color for contrast on white background
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 6, 75, 75)), // Changed indicator color for contrast
            ),
          ],
        ),
      ),
    );
  }
}

// 2. HomePage is now a StatefulWidget to manage tab selection and dynamic content
class HomePage extends StatefulWidget {
  final int initialIndex; // New parameter to set initial selected tab

  const HomePage({super.key, this.initialIndex = 0}); // Default to 0 if not provided

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex; // Initialize with initialIndex

  // Mock data for sports events (remains here as it might be used by multiple pages)
  final List<Map<String, String>> mockEvents = const [
    {
      'league': 'English Premier League',
      'team1': 'Manchester United',
      'team2': 'Liverpool',
      'time': 'Today, 19:00',
      'odds1': '2.10',
      'oddsX': '3.40',
      'odds2': '3.25',
    },
    {
      'league': 'La Liga',
      'team1': 'Real Madrid',
      'team2': 'Barcelona',
      'time': 'Today, 21:00',
      'odds1': '2.20',
      'oddsX': '3.30',
      'odds2': '3.10',
    },
    {
      'league': 'Serie A',
      'team1': 'Juventus',
      'team2': 'Inter Milan',
      'time': 'Tomorrow, 18:30',
      'odds1': '1.90',
      'oddsX': '3.50',
      'odds2': '3.80',
    },
    {
      'league': 'Bundesliga',
      'team1': 'Bayern Munich',
      'team2': 'Borussia Dortmund',
      'time': 'Tomorrow, 20:00',
      'odds1': '1.50',
      'oddsX': '4.50',
      'odds2': '5.00',
    },
    {
      'league': 'Ligue 1',
      'team1': 'PSG',
      'team2': 'Marseille',
      'time': 'Sat, 17:00',
      'odds1': '1.30',
      'oddsX': '5.00',
      'odds2': '7.00',
    },
  ];

  // A list of widgets to display based on the selected navigation tab
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Use the initialIndex from the constructor
    _pages = <Widget>[
      // Index 0: Menu/All Matches (your original ListView.builder)
      _buildAllMatchesView(),
      // Index 1: Sports/League Selection
      LeagueSelectionPage(
        allEvents: mockEvents, // Pass all events to the league selection page
      ),
      // Index 2: Betslip
      const Center(child: Text('Betslip Content', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black))), // Text color changed for visibility
      // Index 3: My Bets
      const Center(child: Text('My Bets Content', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black))), // Text color changed for visibility
      // Index 4: Account
      const AccountPage(), // Use the new AccountPage here
    ];
  }

  // Helper method to build the 'All Matches' view
  Widget _buildAllMatchesView() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: mockEvents.length,
      itemBuilder: (context, index) {
        final event = mockEvents[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: () {
              print('Tapped on ${event['league']!} - ${event['team1']} vs ${event['team2']}');
              // TODO: Implement navigation or show match details here
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // League and Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        event['league']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[700],
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        event['time']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey[500],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Teams
                  Text(
                    '${event['team1']} vs ${event['team2']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Odds
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildOddsButton(context, '1', event['odds1']!),
                      _buildOddsButton(context, 'X', event['oddsX']!),
                      _buildOddsButton(context, '2', event['odds2']!),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper method to build odds buttons (remains the same)
  Widget _buildOddsButton(BuildContext context, String label, String odds) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: () {
            // TODO: Implement logic to add to betslip
            print('Bet on $label (${odds}) for this match');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 6, 75, 75), // Button background color
            foregroundColor: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                odds,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // New helper method for the horizontal menu below the AppBar
  Widget _buildHorizontalMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Row(
        children: [
          _buildMenuItem(Icons.sports_soccer_sharp, 'Sport'),
          _buildMenuItem(Icons.live_tv, 'Live Now'),
          _buildMenuItem(Icons.casino, 'Casino'),
          _buildMenuItem(Icons.videogame_asset, 'Virtual'),
          _buildMenuItem(Icons.flight_takeoff, 'Aviator'),
          _buildMenuItem(Icons.attach_money, 'Jackpot'),
          _buildMenuItem(Icons.star, 'Pawa'),
        ],
      ),
    );
  }

  // Helper for individual menu items in the horizontal scroll
  Widget _buildMenuItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: const Color.fromARGB(255, 6, 75, 75),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed to white
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 75, 75),
        title: const Text('betPawa', style: TextStyle(color: Colors.white)),
        leading: Builder( // Use Builder to provide context for Scaffold.of
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_outlined, color: Colors.white54),
            onPressed: () => Scaffold.of(context).openDrawer(), // Open the drawer
          ),
        ),
        actions: [
          // Amount Deposit Balance
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Balance: \$123.45', // Placeholder balance
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
          // Search Icon
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              print('Search icon pressed!');
              // TODO: Implement search functionality
            },
          ),
          const SizedBox(width: 8),
          const Icon(Icons.notification_add_rounded, color: Colors.white),
          const SizedBox(width: 8),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 6, 75, 75),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'betPawa Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'User Name', // Replace with dynamic user name
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // League Section
            ListTile(
              title: const Text('LEAGUE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)),
              onTap: () {
                print('League category tapped');
              },
            ),
            ListTile(
              leading: const Icon(Icons.emoji_events), // FIFA Cup icon
              title: const Text('FIFA Club World Cup'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1; // Go to Sports tab
                });
                // TODO: Further filter LeagueSelectionPage to this league
                print('FIFA Club World Cup selected from drawer');
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_soccer),
              title: const Text('Premier League'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1; // Go to Sports tab
                });
                // TODO: Further filter LeagueSelectionPage to this league
                print('Premier League selected from drawer');
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_soccer),
              title: const Text('Serie A'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1; // Go to Sports tab
                });
                // TODO: Further filter LeagueSelectionPage to this league
                print('Serie A selected from drawer');
              },
            ),
            const Divider(),
            // Popular Countries Section
            ListTile(
              title: const Text('POPULAR COUNTRIES', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)),
              onTap: () {
                print('Popular Countries category tapped');
              },
            ),
            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text('England'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement navigation/filter by country
                print('England selected');
              },
            ),
            ListTile(
              leading: const Icon(Icons.public), // Using public icon for international
              title: const Text('International'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement navigation/filter by country
                print('International selected');
              },
            ),
            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text('Italy'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement navigation/filter by country
                print('Italy selected');
              },
            ),
            const Divider(),
            // Other Countries Section
            ListTile(
              title: const Text('OTHER COUNTRIES', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)),
              onTap: () {
                print('Other Countries category tapped');
              },
            ),
            // Example of how to add more countries. You would ideally fetch these from a data source.
            ListTile(leading: const Icon(Icons.public), title: const Text('Germany'), onTap: () { Navigator.pop(context); print('Germany selected'); }),
            ListTile(leading: const Icon(Icons.public), title: const Text('France'), onTap: () { Navigator.pop(context); print('France selected'); }),
            ListTile(leading: const Icon(Icons.public), title: const Text('Brazil'), onTap: () { Navigator.pop(context); print('Brazil selected'); }),
            ListTile(leading: const Icon(Icons.public), title: const Text('Argentina'), onTap: () { Navigator.pop(context); print('Argentina selected'); }),
            ListTile(leading: const Icon(Icons.public), title: const Text('Japan'), onTap: () { Navigator.pop(context); print('Japan selected'); }),
            ListTile(leading: const Icon(Icons.public), title: const Text('Spain'), onTap: () { Navigator.pop(context); print('Spain selected'); }),
            ListTile(leading: const Icon(Icons.public), title: const Text('USA'), onTap: () { Navigator.pop(context); print('USA selected'); }),
            ListTile(leading: const Icon(Icons.public), title: const Text('Canada'), onTap: () { Navigator.pop(context); print('Canada selected'); }),
            ListTile(leading: const Icon(Icons.public), title: const Text('Mexico'), onTap: () { Navigator.pop(context); print('Mexico selected'); }),
            ListTile(leading: const Icon(Icons.public), title: const Text('Australia'), onTap: () { Navigator.pop(context); print('Australia selected'); }),
            ListTile(leading: const Icon(Icons.public), title: const Text('South Africa'), onTap: () { Navigator.pop(context); print('South Africa selected'); }),
            // Add more countries here...
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent, // Important for the curve effect
        color: const Color(0xFF075E54), // WhatsApp dark green
        buttonBackgroundColor: Colors.white, // White circle for selected icon
        height: 60.0, // Standard height for CurvedNavigationBar
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          print('Selected tab: $index');
        },
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          Icon(
            Icons.menu_outlined,
            size: 30,
            color: _selectedIndex == 0 ? const Color.fromARGB(255, 6, 75, 75) : Colors.white54,
          ),
          Icon(
            Icons.sports_soccer_sharp,
            size: 30,
            color: _selectedIndex == 1 ? const Color.fromARGB(255, 6, 75, 75) : Colors.white54,
          ),
          // Betslip icon - will be inside the white circle when selected
          Icon(
            Icons.aod_outlined,
            size: 30,
            color: _selectedIndex == 2 ? const Color.fromARGB(255, 6, 75, 75) : Colors.white54,
          ),
          Icon(
            Icons.bookmarks_outlined,
            size: 30,
            color: _selectedIndex == 3 ? const Color.fromARGB(255, 6, 75, 75) : Colors.white54,
          ),
          Icon(
            Icons.account_circle_rounded,
            size: 30,
            color: _selectedIndex == 4 ? const Color.fromARGB(255, 6, 75, 75) : Colors.white54,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('New bet button pressed!');
          // TODO: Implement actual action for the Floating Action Button
        },
        child: const Text('New', style: TextStyle(fontSize: 17, color: Colors.black54)),
      ),
      // Display the page corresponding to the selected index
      body: Column( // Wrap the body content in a Column
        children: [
          _buildHorizontalMenu(), // The new horizontal scrolling menu
          Expanded( // Ensure the rest of the body takes available space
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

// New Widget: LeagueSelectionPage (remains the same)
class LeagueSelectionPage extends StatefulWidget {
  final List<Map<String, String>> allEvents; // Pass all events to potentially filter them

  const LeagueSelectionPage({super.key, required this.allEvents});

  @override
  State<LeagueSelectionPage> createState() => _LeagueSelectionPageState();
}

class _LeagueSelectionPageState extends State<LeagueSelectionPage> {
  String? _selectedLeague;
  late List<String> _leagues;
  List<Map<String, String>> _filteredEvents = [];

  @override
  void initState() {
    super.initState();
    // Extract unique leagues from all events
    _leagues = widget.allEvents.map((event) => event['league']!).toSet().toList();
    _leagues.sort(); // Sort leagues alphabetically
    if (_leagues.isNotEmpty) {
      _selectedLeague = _leagues.first; // Select the first league by default
      _filterEventsByLeague(_selectedLeague);
    }
  }

  void _filterEventsByLeague(String? league) {
    if (league == null) {
      _filteredEvents = []; // Clear events if no league is selected (or show all)
    } else {
      _filteredEvents = widget.allEvents
          .where((event) => event['league'] == league)
          .toList();
    }
  }

  // Helper method to build odds buttons (copied for self-containment in this new widget's scope)
  Widget _buildOddsButton(BuildContext context, String label, String odds) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: () {
            // TODO: Implement logic to add to betslip
            print('Bet on $label (${odds}) for this match');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 6, 75, 75), // Button background color
            foregroundColor: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                odds,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButtonFormField<String>(
            value: _selectedLeague,
            decoration: InputDecoration(
              labelText: 'Select League',
              labelStyle: const TextStyle(color: Colors.black54), // Adjusted for white background
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blueGrey), // Adjusted for white background
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blueGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              filled: true,
              fillColor: Colors.grey[100], // Input field background
            ),
            items: _leagues.map((String league) {
              return DropdownMenuItem<String>(
                value: league,
                child: Text(league, style: const TextStyle(color: Colors.black)), // Dropdown item text color
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedLeague = newValue;
                _filterEventsByLeague(newValue); // Filter events based on selection
              });
              print('Selected League: $newValue');
            },
          ),
        ),
        Expanded(
          child: _filteredEvents.isEmpty && _selectedLeague != null // Show message if no events for selected league
              ? Center(
                  child: Text(
                    'No matches found for $_selectedLeague.',
                    style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: _filteredEvents.length,
                  itemBuilder: (context, index) {
                    final event = _filteredEvents[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: InkWell(
                        onTap: () {
                          print('Tapped on ${event['league']!} - ${event['team1']} vs ${event['team2']}');
                          // TODO: Implement navigation or show match details here
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // League and Time
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    event['league']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[700],
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    event['time']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueGrey[500],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // Teams
                              Text(
                                '${event['team1']} vs ${event['team2']}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 15),
                              // Odds
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _buildOddsButton(context, '1', event['odds1']!),
                                  _buildOddsButton(context, 'X', event['oddsX']!),
                                  _buildOddsButton(context, '2', event['odds2']!),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

// New Widget: AccountPage
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _numberController = TextEditingController();
  String? _selectedAccountOption;
  final List<String> _accountOptions = const [
    'Notifications',
    'Manage account', // This option will now trigger sub-options
    'My Bets',
    'Statement',
    'Change Language',
    'Logout',
  ];

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Place for number
          TextFormField(
            controller: _numberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Enter your phone number',
              labelStyle: const TextStyle(color: Colors.blueGrey), // Adjusted for white background
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blueGrey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blueGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              prefixIcon: const Icon(Icons.phone, color: Colors.blueGrey), // Adjusted for white background
              filled: true,
              fillColor: Colors.grey[100], // Input field background
            ),
            style: const TextStyle(color: Colors.black), // Input text color
          ),
          const SizedBox(height: 20),

          // Deposit and Withdraw Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    print('Deposit button pressed! Number: ${_numberController.text}');
                    // TODO: Implement deposit logic
                  },
                  icon: const Icon(Icons.account_balance_wallet, color: Colors.white),
                  label: const Text('Deposit', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 75, 75), // Original green
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    print('Withdraw button pressed! Number: ${_numberController.text}');
                    // TODO: Implement withdraw logic
                  },
                  icon: const Icon(Icons.money_off, color: Colors.white),
                  label: const Text('Withdraw', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[700], // Original red
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // My Account Dropdown
          DropdownButtonFormField<String>(
            value: _selectedAccountOption,
            dropdownColor: Colors.white, // Dropdown background color
            style: const TextStyle(color: Colors.black), // Dropdown text color
            decoration: InputDecoration(
              labelText: 'My Account',
              labelStyle: const TextStyle(color: Colors.blueGrey), // Label text color
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blueGrey), // Border color
              ),
              enabledBorder: OutlineInputBorder( // Ensure border is visible when not focused
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blueGrey),
              ),
              focusedBorder: OutlineInputBorder( // Ensure border is visible when focused
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              prefixIcon: const Icon(Icons.person, color: Colors.blueGrey),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            items: _accountOptions.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option, style: const TextStyle(color: Colors.black)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedAccountOption = newValue;
              });
              print('Selected Account Option: $newValue');
              if (newValue == 'Logout') {
                print('Logging out...');
                // Implement logout functionality here
              } else if (newValue == 'My Bets') {
                // Example: Navigate to My Bets page if it's a separate route
                print('Navigating to My Bets...');
              } else if (newValue == 'Manage account') {
                // Keep 'Manage account' selected if it's chosen, which will then show the sub-option
              }
            },
          ),
          // Conditionally show Change Password button if 'Manage account' is selected
          if (_selectedAccountOption == 'Manage account')
            Column(
              children: [
                const SizedBox(height: 10),
                ListTile(
                  title: const Text('Change Password', style: TextStyle(color: Colors.black)), // Text color
                  leading: const Icon(Icons.lock_reset, color: Colors.blueGrey), // Icon color
                  onTap: () {
                    print('Navigating to Change Password page...');
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
                    );
                  },
                  tileColor: Colors.grey[100], // Tile background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

// New Widget: ChangePasswordPage
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (newPassword.isEmpty || confirmPassword.isEmpty || currentPassword.isEmpty) {
      _showMessage(context, 'Please fill all password fields.');
      return;
    }

    if (newPassword != confirmPassword) {
      _showMessage(context, 'New password and confirm password do not match.');
      return;
    }

    // TODO: Implement actual password change logic (e.g., API call)
    print('Current Password: $currentPassword');
    print('New Password: $newPassword');
    _showMessage(context, 'Password change request submitted. (Simulated)');

    // Optionally, clear fields or navigate back
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
    // Navigator.of(context).pop(); // Uncomment to go back after submission
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed to white
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 75, 75),
        title: const Text('Change Password', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Current Password',
                labelStyle: const TextStyle(color: Colors.blueGrey), // Label text color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                prefixIcon: const Icon(Icons.lock, color: Colors.blueGrey),
                filled: true,
                fillColor: Colors.grey[100], // Input field background
              ),
              style: const TextStyle(color: Colors.black), // Input text color
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: const TextStyle(color: Colors.blueGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                prefixIcon: const Icon(Icons.lock_open, color: Colors.blueGrey),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              style: const TextStyle(color: Colors.black), // Input text color
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                labelStyle: const TextStyle(color: Colors.blueGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.blueGrey),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              style: const TextStyle(color: Colors.black), // Input text color
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _changePassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 6, 75, 75), // Button background color
                foregroundColor: Colors.white, // Button text color
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Change Password',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}