import 'package:flutter/material.dart';
import 'package:new_mg_app/components/custom_top_bar.dart';

class ScratchCard extends StatelessWidget {
  const ScratchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: SafeArea(
        top: false,
        child: CustomScrollView(slivers: [CustomTopBar()]),
      ),
    );
  }
}
