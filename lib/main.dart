import 'dart:io';

import 'package:flutter/material.dart';
import 'package:music_player/pages/HomePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Upgrader.clearSavedSettings(); // REMOVE this for release builds
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upgrader Example',
      home: UpgradeAlert(
        child: Scaffold(
          appBar: AppBar(title: const Text('Upgrader Example')),
          body: const Center(child: Text('Checking...')),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Homepage();
  }
}