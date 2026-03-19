import 'package:flutter/material.dart';

class PaymentsComponent extends StatelessWidget {
  const PaymentsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Nenhum pagamento encontrado',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }
}
