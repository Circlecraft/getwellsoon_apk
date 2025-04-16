import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const BaseScreen({
    Key? key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
