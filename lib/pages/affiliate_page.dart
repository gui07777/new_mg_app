import 'package:flutter/material.dart';
import 'package:new_mg_app/components/custom_top_bar_component.dart';
import 'package:new_mg_app/components/link_copy_campaigns_component.dart';
import 'package:new_mg_app/components/payments_component.dart';
import 'package:new_mg_app/components/plunder_component.dart';
import 'package:new_mg_app/components/tab_bar_items_component.dart';

class AffiliatePage extends StatelessWidget {
  const AffiliatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    CustomTopBarComponent(),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          _buildHeaderTitle(),
                          Divider(height: 0),
                          _buildAffiliateCodeCard(),
                          _buildColorfulContainers(
                            Color(0xFFFFA726),
                            'R\$ 0',
                            'Pedidos pagos + pendentes + expirados',
                          ),
                          _buildColorfulContainers(
                            Color(0xFF00897B),
                            'R\$ 0',
                            'Pedidos pagos',
                          ),
                          _buildColorfulContainers(
                            Color(0xFF2E7D32),
                            'R\$ 0',
                            'Valor disponível para saque',
                          ),
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(TabBarItemsComponent()),
                    ),
                  ];
                },

            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: LinkCopyCampaignsComponent(
                      titulo: 'teste mocado $index',
                      data: '12/12/2012',
                      valor: 'R\$ 13,00',
                    ),
                  ),
                ),
                PaymentsComponent(),
                PlunderComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildColorfulContainers(
  Color boxColor,
  String valueBox,
  String textBox,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: Container(
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(valueBox, style: TextStyle(fontSize: 14)),
                Text(textBox, style: TextStyle(fontSize: 12)),
              ],
            ),
            Icon(Icons.money),
          ],
        ),
      ),
    ),
  );
}

Widget _buildHeaderTitle() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        spacing: 12,
        children: [
          Icon(Icons.groups, color: Color(0xFF198754), size: 24),
          Text(
            'Área do Afiliado',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}

Widget _buildAffiliateCodeCard() {
  return Padding(
    padding: const EdgeInsets.all(26.0),
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Esse é seu código de afiliado',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Color(0xFFf5f7fa),
              enabled: false,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 12,
              ),
              hintText: 'DANKGDM5',
            ),
          ),
        ],
      ),
    ),
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _SliverAppBarDelegate(this.child);

  @override
  double get minExtent => 48;
  @override
  double get maxExtent => 48;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
