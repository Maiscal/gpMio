import 'package:flutter/material.dart';

import 'package:practicas/screens/counter_page.dart';
import 'package:practicas/screens/menu_page.dart';
import 'package:practicas/screens/news_page.dart';
import 'package:practicas/screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MenuPage(),
      routes: {
        '/contador': (BuildContext context) => const CounterPage(),
        '/profile_page': (BuildContext context) => const ProfilePage(),
        '/news_page': (BuildContext context) => const NewPage(),
      },
    );
  }
}
