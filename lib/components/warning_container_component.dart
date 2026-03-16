import 'package:flutter/material.dart';

class WarningContainerComponent extends StatelessWidget {
  const WarningContainerComponent({super.key, required this.information});
  final String information;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFfff3cd),
          border: Border.all(color: Color(0xFFFFE69C), width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Icon(Icons.warning_amber_outlined, size: 12),
            SizedBox(width: 5),
            Text(
              information,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
