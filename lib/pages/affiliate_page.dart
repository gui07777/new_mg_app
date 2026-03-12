import 'package:flutter/material.dart';
import 'package:new_mg_app/components/custom_top_bar_component.dart';

class AffiliatePage extends StatelessWidget {
  const AffiliatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: SafeArea(
        child: const CustomScrollView(slivers: [CustomTopBarComponent(),
        ]),
      ),
    );
  }
}
