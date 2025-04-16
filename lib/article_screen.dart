import 'package:flutter/material.dart';
import 'base_screen.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  final List<Map<String, dynamic>> _articles = [
    {
      'title': 'Apa Depresi? Ketahui Gejalanya!',
      'category': 'Mental Health',
      'image': Icons.psychology,
      'color': Colors.blue.shade200,
      'summary':
          'Depresi merupakan gangguan suasana hati yang menyebabkan penderitanya terus-menerus merasa sedih...'
    },
    {
      'title': 'Tips Untuk Mental Sehat',
      'category': 'Self Care',
      'image': Icons.health_and_safety,
      'color': Colors.green.shade200,
      'summary':
          'Mental yang sehat sama pentingnya dengan kesehatan fisik. Berikut adalah beberapa tips untuk menjaga kesehatan mental...'
    },
    {
      'title': 'Manfaat Meditasi Untuk Kesehatan',
      'category': 'Meditation',
      'image': Icons.self_improvement,
      'color': Colors.purple.shade200,
      'summary':
          'Meditasi terbukti memiliki banyak manfaat untuk kesehatan mental dan fisik...'
    },
    {
      'title': 'Musik Untuk Relaksasi',
      'category': 'Music Therapy',
      'image': Icons.music_note,
      'color': Colors.orange.shade200,
      'summary':
          'Musik tertentu dapat membantu Anda rileks dan mengurangi stres...'
    },
  ];

  int _selectedCategoryIndex = 0;
  final List<String> _categories = [
    'Semua',
    'Mental Health',
    'Self Care',
    'Meditation',
    'Music Therapy'
  ];

  @override
  Widget build(BuildContext context) {
    // Filter articles based on selected category
    final List<Map<String, dynamic>> filteredArticles =
        _selectedCategoryIndex == 0
            ? _articles
            : _articles
                .where((article) =>
                    article['category'] == _categories[_selectedCategoryIndex])
                .toList();

    return BaseScreen(
      title: 'Articles',
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Categories Horizontal Scrolling
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: _selectedCategoryIndex == index
                            ? Colors.blue
                            : Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          _categories[index],
                          style: TextStyle(
                            color: _selectedCategoryIndex == index
                                ? Colors.white
                                : Colors.blue.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Articles
            Expanded(
              child: filteredArticles.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.article_outlined,
                            size: 80,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Tidak ada artikel',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredArticles.length,
                      itemBuilder: (context, index) {
                        final article = filteredArticles[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigate to article detail
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Fitur detail artikel sedang dikembangkan'),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: article['color'],
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      article['image'],
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade50,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          article['category'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.blue.shade800,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        article['title'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        article['summary'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Baca Selengkapnya',
                                            style: TextStyle(
                                              color: Colors.blue.shade800,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 16,
                                            color: Colors.blue.shade800,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
}
