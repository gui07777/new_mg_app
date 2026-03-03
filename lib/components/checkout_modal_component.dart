import 'package:flutter/material.dart';

class CheckoutModalComponent extends StatelessWidget {
  const CheckoutModalComponent({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CheckoutModalComponent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      
    );
  }
}