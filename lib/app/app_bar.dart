import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      pinned: true,
      floating: false,
      elevation: 0,
      toolbarHeight: 80,
      centerTitle: true,
      leading: const Icon(Icons.sort, color: Colors.white),
      title: Image.asset('assets/icons/codetech.png', height: 45),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.sms, color: Colors.white, size: 24),
              Text(
                'Suporte',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
