import 'dart:async';

import 'package:flutter/material.dart';

class GetItNowAnimationComponent extends StatefulWidget {
  const GetItNowAnimationComponent({super.key});

  @override
  State<GetItNowAnimationComponent> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GetItNowAnimationComponent> {
  double _visible = 1.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 2800), (timer) {
      if (mounted) {
        setState(() {
          _visible = _visible == 1.0 ? 0.0 : 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible,
      duration: const Duration(milliseconds: 1000),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 49, 136, 51),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Text(
          "Adquira já",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
