import 'package:flutter/material.dart';

class MyNumbersCardComponent extends StatefulWidget {
  final String name, phone, date, value, status, totalQuantity;
  final List<int> tickets;

  const MyNumbersCardComponent({
    super.key,
    required this.name,
    required this.phone,
    required this.date,
    required this.value,
    required this.status,
    required this.totalQuantity,
    required this.tickets,
  });

  @override
  State<MyNumbersCardComponent> createState() => _MyNumbersCardState();
}

class _MyNumbersCardState extends State<MyNumbersCardComponent> {
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
              _buildActionButtons(),
              if (_isExpanded) ...[_buildGridCondintional()],
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

  Widget _buildActionButtons() {
    return Row(
      children: [
        SizedBox(
          width: 95,
          child: Text(
            'Ações:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF212b36),
            ),
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
    );
  }

  Widget _buildBlueBoxTicket(String tickets) {
    return Container(
      width: 100,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0D3B7A),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        textAlign: TextAlign.center,
        tickets,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildGridCondintional() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: widget.tickets.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 4.5,
      ),
      itemBuilder: (context, index) {
        return _buildBlueBoxTicket(widget.tickets[index].toString());
      },
    );
  }
}
