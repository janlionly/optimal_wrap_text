import 'package:flutter/material.dart';
import 'package:optimal_wrap_text/optimal_wrap_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('OptimalWrapText Example')),
        body: Center(
          child: OptimalWrapText(
            'My slightly longer text that will span 2 or 3 lines',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
