import 'package:flutter/material.dart';
import 'base_screen.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final List<Map<String, dynamic>> _musicCategories = [
    {
      'title': 'Relaksasi',
      'icon': Icons.water,
      'color': Colors.blue.shade200,
    },
    {
      'title': 'Fokus',
      'icon': Icons.psychology,
      'color': Colors.purple.shade200,
    },
    {
      'title': 'Tidur',
      'icon': Icons.nightlight_round,
      'color': Colors.indigo.shade200,
    },
    {
      'title': 'Alam',
      'icon': Icons.forest,
      'color': Colors.green.shade200,
    },
  ];

  final List<Map<String, dynamic>> _musicTracks = [
    {
      'title': 'Suara Hujan',
      'artist': 'Nature Sounds',
      'duration': '3:45',
      'category': 'Relaksasi',
      'cover': Icons.water_drop,
    },
    {
      'title': 'Musik Meditasi',
      'artist': 'Zen Garden',
      'duration': '5:20',
      'category': 'Relaksasi',
      'cover': Icons.spa,
    },
    {
      'title': 'Fokus & Produktif',
      'artist': 'Study Music',
      'duration': '4:15',
      'category': 'Fokus',
      'cover': Icons.psychology,
    },
    {
      'title': 'Lullaby',
      'artist': 'Sleep Sounds',
      'duration': '8:30',
      'category': 'Tidur',
      'cover': Icons.nightlight_round,
    },
    {
      'title': 'Suara Hutan',
      'artist': 'Nature Sounds',
      'duration': '6:10',
      'category': 'Alam',
      'cover': Icons.forest,
    },
  ];

  String _selectedCategory = 'Semua';
  bool _isPlaying = false;
  String _currentTrack = '';
  double _volume = 0.5;

  @override
  Widget build(BuildContext context) {
    // Filter tracks based on selected category
    final List<Map<String, dynamic>> filteredTracks =
        _selectedCategory == 'Semua'
            ? _musicTracks
            : _musicTracks
                .where((track) => track['category'] == _selectedCategory)
                .toList();

    return BaseScreen(
      title: 'Music',
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Music Categories
            const Text(
              'Kategori',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _musicCategories.length + 1, // +1 for "All" category
                itemBuilder: (context, index) {
                  // First item is "All"
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = 'Semua';
                        });
                      },
                      child: Container(
                        width: 80,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: _selectedCategory == 'Semua'
                              ? Colors.blue
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.music_note,
                              size: 30,
                              color: _selectedCategory == 'Semua'
                                  ? Colors.white
                                  : Colors.grey.shade700,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Semua',
                              style: TextStyle(
                                color: _selectedCategory == 'Semua'
                                    ? Colors.white
                                    : Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // Other categories
                  final category = _musicCategories[index - 1];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category['title'];
                      });
                    },
                    child: Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: _selectedCategory == category['title']
                            ? category['color']
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            category['icon'],
                            size: 30,
                            color: _selectedCategory == category['title']
                                ? Colors.white
                                : Colors.grey.shade700,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category['title'],
                            style: TextStyle(
                              color: _selectedCategory == category['title']
                                  ? Colors.white
                                  : Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Music Tracks
            Expanded(
              child: filteredTracks.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.music_off,
                            size: 80,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Tidak ada musik',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredTracks.length,
                      itemBuilder: (context, index) {
                        final track = filteredTracks[index];
                        final bool isActive = _currentTrack == track['title'];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: isActive ? Colors.blue.shade50 : Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  isActive ? Colors.blue : Colors.grey.shade200,
                              child: Icon(
                                track['cover'],
                                color: isActive
                                    ? Colors.white
                                    : Colors.grey.shade700,
                              ),
                            ),
                            title: Text(
                              track['title'],
                              style: TextStyle(
                                fontWeight: isActive
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            subtitle: Text(track['artist']),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(track['duration']),
                                const SizedBox(width: 10),
                                Icon(
                                  isActive && _isPlaying
                                      ? Icons.pause_circle_filled
                                      : Icons.play_circle_filled,
                                  color: isActive
                                      ? Colors.blue
                                      : Colors.grey.shade700,
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                _currentTrack = track['title'];
                                _isPlaying = true;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Memainkan: ${track['title']}'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
            // Music Player
            if (_isPlaying && _currentTrack.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.music_note, color: Colors.blue),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _currentTrack,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Text(
                                'Playing now...',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.pause),
                          onPressed: () {
                            setState(() {
                              _isPlaying = false;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.stop),
                          onPressed: () {
                            setState(() {
                              _isPlaying = false;
                              _currentTrack = '';
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.volume_down, size: 20),
                        Expanded(
                          child: Slider(
                            value: _volume,
                            min: 0.0,
                            max: 1.0,
                            onChanged: (value) {
                              setState(() {
                                _volume = value;
                              });
                            },
                          ),
                        ),
                        const Icon(Icons.volume_up, size: 20),
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
