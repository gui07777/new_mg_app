import 'package:flutter/material.dart';
import 'package:new_mg_app/pages/home_page.dart';
import 'package:new_mg_app/pages/my_numbers_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/my-numbers': (context) => const MyNumbersPage(),
      },
    );
  }
}