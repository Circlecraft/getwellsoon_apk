import 'package:flutter/material.dart';
import 'base_screen.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({Key? key}) : super(key: key);

  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  final List<String> moods = [
    'Sangat Senang',
    'Senang',
    'Netral',
    'Sedih',
    'Sangat Sedih',
  ];

  final List<IconData> moodIcons = [
    Icons.sentiment_very_satisfied,
    Icons.sentiment_satisfied,
    Icons.sentiment_neutral,
    Icons.sentiment_dissatisfied,
    Icons.sentiment_very_dissatisfied,
  ];

  final List<Color> moodColors = [
    Colors.green,
    Colors.lightGreen,
    Colors.amber,
    Colors.orange,
    Colors.red,
  ];

  int _selectedMood = 1; // Default to 'Senang'
  final TextEditingController _noteController = TextEditingController();

  List<Map<String, dynamic>> _moodHistory = [
    {
      'date': '10 Maret 2025',
      'mood': 'Senang',
      'note': 'Hari yang cerah dan produktif',
      'index': 1
    },
    {
      'date': '9 Maret 2025',
      'mood': 'Netral',
      'note': 'Hari biasa saja',
      'index': 2
    },
    {
      'date': '8 Maret 2025',
      'mood': 'Sedih',
      'note': 'Proyek tidak berjalan lancar',
      'index': 3
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Mood Tracker',
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Today's Mood Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bagaimana perasaanmu hari ini?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMood = index;
                          });
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: _selectedMood == index
                                  ? moodColors[index]
                                  : Colors.grey.shade300,
                              radius: 25,
                              child: Icon(
                                moodIcons[index],
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              moods[index],
                              style: TextStyle(
                                fontWeight: _selectedMood == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _noteController,
                    decoration: InputDecoration(
                      hintText: 'Tambahkan catatan tentang mood-mu...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _moodHistory.insert(0, {
                          'date': '11 Maret 2025',
                          'mood': moods[_selectedMood],
                          'note': _noteController.text,
                          'index': _selectedMood
                        });
                        _noteController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Mood hari ini tersimpan!'),
                          ),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Simpan Mood',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Mood History
            const Text(
              'Riwayat Mood',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _moodHistory.length,
                itemBuilder: (context, index) {
                  final item = _moodHistory[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: moodColors[item['index']],
                        child: Icon(
                          moodIcons[item['index']],
                          color: Colors.white,
                        ),
                      ),
                      title: Text(item['date']),
                      subtitle: Text(
                        item['note'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        item['mood'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        // Show detail view
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Mood: ${item['date']}'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      moodIcons[item['index']],
                                      color: moodColors[item['index']],
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      item['mood'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(item['note']),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Tutup'),
                              ),
                            ],
                          ),
                        );
                      },
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

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }
}
