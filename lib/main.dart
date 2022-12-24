import 'package:flutter/material.dart';

import 'mcq_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MCQPage(title: 'Razan QuizLer APP'),
    );
  }
}



//ctrl + alt + L //format
//shift alt for multi line changes
