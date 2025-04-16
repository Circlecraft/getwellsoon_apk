import 'package:flutter/material.dart';
import 'base_screen.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  final List<Map<String, dynamic>> _meditations = [
    {
      'title': 'Meditasi Pagi',
      'duration': '10 menit',
      'level': 'Pemula',
      'image': Icons.brightness_5,
      'color': Colors.orange.shade200,
    },
    {
      'title': 'Fokus & Konsentrasi',
      'duration': '15 menit',
      'level': 'Menengah',
      'image': Icons.center_focus_strong,
      'color': Colors.blue.shade200,
    },
    {
      'title': 'Tidur Nyenyak',
      'duration': '20 menit',
      'level': 'Semua',
      'image': Icons.nightlight_round,
      'color': Colors.purple.shade200,
    },
    {
      'title': 'Mengurangi Stres',
      'duration': '12 menit',
      'level': 'Pemula',
      'image': Icons.spa,
      'color': Colors.green.shade200,
    },
  ];

  bool _isPlaying = false;
  String _currentMeditation = '';

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Meditation',
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                    'Tenangkan Pikiranmu',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Meditasi reguler dapat membantu mengurangi stres, meningkatkan fokus, dan meningkatkan kesejahteraan mental secara keseluruhan.',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pilih Meditasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: _meditations.length,
                itemBuilder: (context, index) {
                  final meditation = _meditations[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentMeditation = meditation['title'];
                        _isPlaying = true;
                      });
                      // Play meditation audio
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Memulai meditasi: ${meditation['title']}'),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: meditation['color'],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Icon(
                              meditation['image'],
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            meditation['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  meditation['duration'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  meditation['level'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Current Meditation Player
            if (_isPlaying)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.spa, color: Colors.blue),
                        const SizedBox(width: 10),
                        Text(
                          'Now Playing: $_currentMeditation',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.close, size: 20),
                          onPressed: () {
                            setState(() {
                              _isPlaying = false;
                              _currentMeditation = '';
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.skip_previous),
                          onPressed: () {
                            // Previous logic
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.pause, size: 30),
                          onPressed: () {
                            // Pause/play logic
                            setState(() {
                              // Toggle play state
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_next),
                          onPressed: () {
                            // Next logic
                          },
                        ),
                      ],
                    ),
                    const LinearProgressIndicator(
                      value: 0.3,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('01:30'),
                        Text('05:00'),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
