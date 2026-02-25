import 'package:flutter/material.dart';

class FrequentlyQuestions extends StatefulWidget {
  final String title, subtitle;
  
  const FrequentlyQuestions({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<FrequentlyQuestions> createState() => _FrequentlyQuestionsState();
}

class _FrequentlyQuestionsState extends State<FrequentlyQuestions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: ExpansionTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),

        title: Text(
          widget.title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        trailing: SizedBox.shrink(),
        leading: Icon(Icons.arrow_forward, size: 18),

        children: [
          ListTile(
            title: Text(widget.subtitle, style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}