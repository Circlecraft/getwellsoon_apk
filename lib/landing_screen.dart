import 'package:flutter/material.dart';
import 'package:getwellsoon_apk/pages/article_screen.dart';
import 'mood_tracker_screen.dart';
import 'journal_log_screen.dart';
import 'meditation_screen.dart';
import 'music_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selamat datang, User!'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('User'),
              accountEmail: const Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('U',
                    style: TextStyle(fontSize: 40, color: Colors.blue)),
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),
            _buildDrawerItem(Icons.home, 'Main Page', 0),
            _buildDrawerItem(Icons.track_changes, 'Mood Tracker', 1),
            _buildDrawerItem(Icons.book, 'Journal Log', 2),
            _buildDrawerItem(Icons.article, 'Articles', 3),
            _buildDrawerItem(Icons.self_improvement, 'Meditation', 4),
            _buildDrawerItem(Icons.music_note, 'Music', 5),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Date and Mood Section
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selasa, 11 Maret 2025 • 18:40',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Mood saat ini: Senang',
                        style: TextStyle(
                          color: Colors.blue.shade800,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.sentiment_very_satisfied,
                          color: Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Daily Notes Section
            const Text(
              'Catatan Hari Ini:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.yellow.shade100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Tambahkan kata-katamu...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),

            const SizedBox(height: 16),

            // Recommended Section
            const Text(
              'Recommended:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildRecommendedCard(
                    'Apa Depresi? Ketahui Gejalanya!',
                    Icons.psychology,
                    Colors.blue.shade200,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildRecommendedCard(
                    'Tips Untuk Mental Sehat',
                    Icons.health_and_safety,
                    Colors.green.shade200,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          // Navigation logic
          switch (index) {
            case 0:
              // Home page (current page)
              break;
            case 1:
              // Journal page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const JournalLogScreen()),
              );
              break;
            case 2:
              // Notes page
              // You can add navigation to a Notes screen here
              break;
            case 3:
              // Relax page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MeditationScreen()),
              );
              break;
            case 4:
              // Logout
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Journal'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Notes'),
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: 'Relax'),
          BottomNavigationBarItem(
              icon: Icon(Icons.power_settings_new), label: 'Logout'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        setState(() {
          _selectedIndex = index;
        });

        // Navigate to respective screens based on index
        switch (index) {
          case 0: // Main Page
            // Already on the main page, no navigation needed
            break;
          case 1: // Mood Tracker
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MoodTrackerScreen()),
            );
            break;
          case 2: // Journal Log
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JournalLogScreen()),
            );
            break;
          case 3: // Articles
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ArticlesScreen()),
            );
            break;
          case 4: // Meditation
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MeditationScreen()),
            );
            break;
          case 5: // Music
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MusicScreen()),
            );
            break;
        }
      },
    );
  }

  Widget _buildRecommendedCard(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
