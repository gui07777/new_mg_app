import 'package:flutter/material.dart';

class SelectDrawComponent extends StatefulWidget {
  SelectDrawComponent({super.key});
  final List<String> opcoes = ['Opção 1', 'Opção 2', 'Opção 3'];

  @override
  State<SelectDrawComponent> createState() => _SelectDrawComponentState();
}

class _SelectDrawComponentState extends State<SelectDrawComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selecione o sorteio',
          style: TextStyle(
            color: Color(0xFF454f5b),
            fontWeight: FontWeight.w500,
            fontSize: 13,
            height: 2.2,
          ),
        ),
        Container(
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              padding: EdgeInsets.symmetric(horizontal: 6),
              isExpanded: true,
              hint: Text('Guilherme'),
              items: widget.opcoes.map((String opcao) {
                return DropdownMenuItem<String>(
                  value: opcao,
                  child: Text(opcao),
                );
              }).toList(),
              onChanged: (String? novoValor) {
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
}
