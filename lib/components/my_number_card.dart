import 'package:flutter/material.dart';

class MyNumbersCard extends StatefulWidget {
  final String name, phone, date, value, status, totalQuantity;

  const MyNumbersCard({
    super.key,
    required this.name,
    required this.phone,
    required this.date,
    required this.value,
    required this.status,
    required this.totalQuantity,
  });

  @override
  State<MyNumbersCard> createState() => _MyNumbersCardState();
}

class _MyNumbersCardState extends State<MyNumbersCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('Nome:', widget.name),
              _buildInfoRow('Telefone:', widget.phone),
              _buildInfoRow('Data:', widget.date),
              _buildInfoRow('Valor:', 'R\$${widget.value}'),
              _buildInfoRow('Status:', widget.status),
              _buildInfoRow('Quantidade total:', widget.totalQuantity),
              Row(
                children: [
                  Text(
                    'Ações:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF212b36),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    icon: Icon(Icons.print, color: Color(0xFF212b36)),
                    label: Text(
                      'Ver títulos',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF212b36),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.print, color: Color(0xFF212b36)),
                    label: Text(
                      'Ver jogos',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF212b36),
                      ),
                    ),
                  ),
                ],
              ),

              if (_isExpanded) ...[
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildBlueBoxTicket('6934320'),
                    _buildBlueBoxTicket('0989590'),
                    _buildBlueBoxTicket('8117870'),
                    _buildBlueBoxTicket('0048555'),
                    _buildBlueBoxTicket('6934320'),
                    _buildBlueBoxTicket('0989590'),
                    _buildBlueBoxTicket('8117870'),
                    _buildBlueBoxTicket('0048555'),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlueBoxTicket(String number) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0D3B7A),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        number,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
