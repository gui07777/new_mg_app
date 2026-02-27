import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class DescriptionRegulationComponent extends StatefulWidget {
  final String description, prizes;
  const DescriptionRegulationComponent({
    super.key,
    required this.description,
    required this.prizes,
  });

  @override
  State<DescriptionRegulationComponent> createState() => _DescriptionRegulationState();
}

class _DescriptionRegulationState extends State<DescriptionRegulationComponent> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
              turns: _isExpanded ? 0.5 : 00,
              duration: Duration(milliseconds: 300),
              child: Icon(
                BootstrapIcons.arrow_down_square_fill,
                color: Colors.black,
                size: 16,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Descrição/Regulamento',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        trailing: SizedBox.shrink(),
        children: [
          ListTile(
            title: Text(
              'Descrição: ${widget.description}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              'Prêmios:\n ${widget.prizes}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
