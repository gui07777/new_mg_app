import 'package:flutter/material.dart';
import 'package:new_mg_app/app/app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: Bar(), backgroundColor: Colors.white, body:  Container());
  }
}