import 'package:flutter/material.dart';

import 'package:todoapp/todoproject.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Data App ',
      theme: ThemeData(
  
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      home: const Mockup(),
    );
  }
}

