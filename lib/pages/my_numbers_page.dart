import 'package:flutter/material.dart';
import 'package:new_mg_app/components/custom_top_bar_component.dart';
import 'package:new_mg_app/components/my_number_card_component.dart';
import 'package:new_mg_app/components/search_purchases_modal_component.dart';
import 'package:new_mg_app/constants/enums.dart';
import 'package:new_mg_app/models/purchase_model.dart';

class MyNumbersPage extends StatelessWidget {
  const MyNumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rawArgs = ModalRoute.of(context)?.settings.arguments;
    List<Purchase> purchases = [];

    if (rawArgs is List) {
      purchases = rawArgs.map((e) => Purchase.fromJson(e)).toList();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            CustomTopBarComponent(),
            _buildHeader(context),
            purchases.isEmpty ? _buildEmptyState() : _buildList(purchases),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
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
            onPressed: () {
              SearchPurchasesModalComponent.show(
                context,
                WhoCall.myNumbersPage,
              );
            },
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
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            ),
            child: const Row(
              children: [
                Icon(Icons.search),
                Text(
                  'Buscar',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildList(List<Purchase> purchases) {
  return SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      final p = purchases[index];
      return MyNumbersCardComponent(
        name: p.name,
        phone: p.phone,
        date: p.date,
        value: p.value,
        status: p.status,
        totalQuantity: p.quantity,
        tickets: p.tickets,
      );
    }, childCount: purchases.length),
  );
}

Widget _buildEmptyState() {
  return const SliverFillRemaining(
    hasScrollBody: false,
    child: Center(child: Text('Nenhum título encontrado.')),
  );
}
