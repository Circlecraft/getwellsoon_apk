import 'package:flutter/material.dart';
import 'base_screen.dart';

class JournalLogScreen extends StatefulWidget {
  const JournalLogScreen({Key? key}) : super(key: key);

  @override
  _JournalLogScreenState createState() => _JournalLogScreenState();
}

class _JournalLogScreenState extends State<JournalLogScreen> {
  final List<Map<String, dynamic>> _journals = [
    {
      'id': 1,
      'title': 'Hari yang Menyenangkan',
      'content': 'Hari ini saya menghabiskan waktu bersama teman-teman...',
      'date': '10 Maret 2025',
      'mood': 'Senang'
    },
    {
      'id': 2,
      'title': 'Refleksi Diri',
      'content': 'Saya merasa perlu untuk memikirkan kembali tujuan hidup...',
      'date': '8 Maret 2025',
      'mood': 'Netral'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Journal Log',
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
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Jurnal Harianmu',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tulis pikiran dan perasaanmu untuk hari ini...',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.book,
                    size: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _journals.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book_outlined,
                            size: 80,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Belum ada jurnal',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Mulai tulis jurnalmu sekarang!',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _journals.length,
                      itemBuilder: (context, index) {
                        final journal = _journals[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(
                              journal['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  journal['content'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      journal['date'],
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: journal['mood'] == 'Senang'
                                            ? Colors.green.shade100
                                            : Colors.blue.shade100,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        journal['mood'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: journal['mood'] == 'Senang'
                                              ? Colors.green.shade800
                                              : Colors.blue.shade800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            onTap: () {
                              // Navigate to journal detail view
                              // This would typically open a detailed journal entry screen
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Fitur detail jurnal sedang dikembangkan'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add journal screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Fitur tambah jurnal sedang dikembangkan'),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
