import 'package:flutter/material.dart';
import 'home_page.dart';
import 'about_page.dart';
import 'donate_page.dart';
import 'locations_page.dart';
import 'splash_screen.dart';

void main() => runApp(const TannMannApp());

class TannMannApp extends StatelessWidget {
  const TannMannApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Poppins'),
      home: const SplashScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const AboutPage(),
    const DonatePage(),
    LocationsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'The Tann Mann Gaadi',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(
          color: Colors.white,
        ), 
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white,
            ), // Explicit white color
            onPressed: () {
              setState(() => _currentIndex = 1);
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Image.asset('assets/logo.png', height: 24),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: 'Donate',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Locations',
          ),
        ],
        onTap: (index) {
          if (index == 2) return;
          setState(() => _currentIndex = index > 2 ? index - 1 : index);
        },
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          // In _buildDrawer method:
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.orange),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 80),
                const SizedBox(height: 10),
                const Text(
                  'The Tann Mann Gaadi',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ExpansionTile(
            leading: const Icon(Icons.info, color: Colors.orange),
            title: const Text('About Us'),
            children: [
              ListTile(title: const Text('Our Mission'), onTap: () {}),
              ListTile(title: const Text('Our Team'), onTap: () {}),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.orange),
            title: const Text('Volunteer'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contact_page, color: Colors.orange),
            title: const Text('Contact Us'),
            onTap: () {},
          ),
          ExpansionTile(
            leading: const Icon(Icons.help, color: Colors.orange),
            title: const Text('FAQ'),
            children: [
              ListTile(title: const Text('How to Donate?'), onTap: () {}),
              ListTile(title: const Text('Where we work?'), onTap: () {}),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Connect With Us',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.facebook, color: Colors.blue),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.telegram, color: Colors.lightBlue),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.youtube_searched_for,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.link, color: Colors.green),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
