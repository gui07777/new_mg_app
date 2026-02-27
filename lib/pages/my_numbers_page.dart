import 'package:flutter/material.dart';
import 'package:new_mg_app/components/custom_top_bar_component.dart';
import 'package:new_mg_app/components/my_number_card_component.dart';

class MyNumbersPage extends StatelessWidget {
  const MyNumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            CustomTopBarComponent(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                child: Row(
                  children: [
                    const Text(
                      ' 🛒 Meus títulos',
                      style: TextStyle(
                        fontSize: 21,
                        color: Color(0xFF212b36),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0D6EFD),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(
                          0,
                          30,
                        ), //forçar o achatamento do botão. 0 é altura minima e 30 é a altura desejada
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 0,
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search),
                          Text(
                            'Buscar',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: MyNumbersCardComponent(
                name: 'Dani Dani',
                phone: '(11) 11111-1111',
                date: '16/01/2026 - 11:12h',
                value: '0.07',
                status: 'Confirmado',
                totalQuantity: '8',
              ),
            ),
            SliverToBoxAdapter(
              child: MyNumbersCardComponent(
                name: 'Dani Dani',
                phone: '(11) 11111-1111',
                date: '16/01/2026 - 11:12h',
                value: '0.07',
                status: 'Confirmado',
                totalQuantity: '8',
              ),
            ),
            SliverToBoxAdapter(
              child: MyNumbersCardComponent(
                name: 'Dani Dani',
                phone: '(11) 11111-1111',
                date: '16/01/2026 - 11:12h',
                value: '0.07',
                status: 'Confirmado',
                totalQuantity: '8',
              ),
            ),
            SliverToBoxAdapter(
              child: MyNumbersCardComponent(
                name: 'Dani Dani',
                phone: '(11) 11111-1111',
                date: '16/01/2026 - 11:12h',
                value: '0.07',
                status: 'Confirmado',
                totalQuantity: '8',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
