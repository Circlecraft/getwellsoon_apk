import 'package:flutter/material.dart';
import 'package:getwellsoon_apk/pages/article_screen.dart';
import 'package:getwellsoon_apk/pages/journal_log_screen.dart';
import 'package:getwellsoon_apk/pages/landing_screen.dart';
import 'package:getwellsoon_apk/pages/login_screen.dart';
import 'package:getwellsoon_apk/pages/meditation_screen.dart';
import 'package:getwellsoon_apk/pages/mood_tracker_screen.dart';
import 'package:getwellsoon_apk/pages/music_screen.dart';
import 'package:getwellsoon_apk/pages/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: {
        '/': (context) => const LoginScreen(),
        '/login': (context) => const LoginScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/landing': (context) => const LandingScreen(),
        '/mood_tracker': (context) => const MoodTrackerScreen(),
        '/journal_log': (context) => const JournalLogScreen(),
        '/articles': (context) => const ArticlesScreen(),
        '/meditation': (context) => const MeditationScreen(),
        '/music': (context) => const MusicScreen(),
      },
    );
  }
}

class AppTheme {
  static var lightTheme;
}
