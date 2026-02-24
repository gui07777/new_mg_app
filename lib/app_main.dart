import 'package:flutter/material.dart';
import 'package:new_mg_app/components/home.dart';
import 'package:new_mg_app/components/my_numbers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/my-numbers': (context) => const MyNumbers(),
      },
    );
  }
}