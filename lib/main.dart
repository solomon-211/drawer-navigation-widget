import 'package:flutter/material.dart';
import 'pages.dart';

void main(){
  runApp(DrawerDemoApp());
}

class DrawerDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade700,
          foregroundColor: Colors.white,
        ),
      ),
      home: HomeShell(),
    );
  }
}

/// One entry in the drawer: its label, its icon and the page it shows.
class Destination {
  Destination(this.label, this.icon, this.page);

  final String label;
  final IconData icon;
  final Widget page;
}

final destinations = [
  Destination('Home', Icons.home_outlined, HomePage()),
  Destination('Profile', Icons.person_outline, ProfilePage()),
  Destination('Settings', Icons.settings_outlined, SettingsPage()),
  Destination('Message', Icons.message_outlined, Message()),
];

/// The single Scaffold that owns the drawer. Tapping a drawer item only swaps
/// the body, so the AppBar and the drawer stay in place.
class HomeShell extends StatefulWidget {
  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final destination = destinations[_selectedIndex];

    return Scaffold(
      appBar: AppBar(title: Text(destination.label)),
      // Setting `drawer` makes the AppBar show the menu button automatically.
      drawer: AppDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
      body: destination.page,
    );
  }
}

/// The navigation drawer: a header and one tile per destination.
class AppDrawer extends StatelessWidget {
  AppDrawer({
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      // ListView so the drawer scrolls on small screens. Zero padding lets the
      // header draw behind the status bar.
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Solomon Leek'),
            accountEmail: Text('s.leek@alustudent.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: colorScheme.onPrimary,
              child: Text(
                'SL',
                style: TextStyle(fontSize: 24, color: colorScheme.primary),
              ),
            ),
          ),
          for (var i = 0; i < destinations.length; i++)
            ListTile(
              leading: Icon(destinations[i].icon),
              title: Text(destinations[i].label),
              selected: i == selectedIndex,
              selectedTileColor: colorScheme.primaryContainer,
              onTap: () {
                // The drawer is a route on the Navigator, so pop() closes it.
                Navigator.pop(context);
                onDestinationSelected(i);
              },
            ),
        ],
      ),
    );
  }
}
