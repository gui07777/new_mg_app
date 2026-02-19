import 'package:flutter/material.dart';
import 'package:new_mg_app/components/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(), debugShowCheckedModeBanner: false,);
  }

  
}