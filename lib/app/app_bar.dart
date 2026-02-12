import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Colors.black,
            actions: [
              IconButton(icon: Icon(Icons.sort), onPressed: null),

              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Image.asset('assets/images/logo.png', height: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
