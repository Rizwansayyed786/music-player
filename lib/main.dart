import 'dart:io';

import 'package:flutter/material.dart';
import 'package:music_player/pages/HomePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      home: Scaffold(
          appBar: AppBar(title: const Text('Upgrader Example')),
          body: Homepage(),
      )
    );
  }
}