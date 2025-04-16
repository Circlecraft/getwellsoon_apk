import 'package:flutter/material.dart';
import 'package:gws_start/landing_screen.dart';
import 'package:gws_start/login_screen.dart';
import 'package:gws_start/registration_screen.dart';

void main() {
  runApp(const MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Well Soon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/registration',
      routes: {
        '/registration': (context) => const RegistrationScreen(),
        '/login': (context) => const LoginScreen(),
        '/landing': (context) => const LandingScreen(),
      },
    );
  }
}
