import 'package:flutter/material.dart';
import 'ui/awal_screen.dart';
import 'ui/tambah_screen.dart';
import 'ui/list_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) =>  const AwalScreen(),
        '/tambah': (context) => TambahScreen(),
        '/list': (context) => ListScreen(),
      },
    );
  }
}


