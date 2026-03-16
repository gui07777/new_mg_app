import 'package:flutter/material.dart';
import 'package:new_mg_app/components/link_copy_campaigns_component.dart';

class TabBarItemsComponent extends StatelessWidget {
  const TabBarItemsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomScrollView(
        slivers: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              child: SizedBox(
                height: 35,
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.blue,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(height: 48, text: "Campanhas"),
                    Tab(height: 48, text: "Pagamentos"),
                    Tab(height: 48, text: "Saques"),
                  ],
                  indicatorPadding: EdgeInsets.only(bottom: -1),
                ),
              ),
            ),
          ),
          SliverFillRemaining(child: TabBarView(children: [
            LinkCopyCampaignsComponent(titulo: 'teste mocado', data: '12/12/2012', valor: 'R\$ 13,00')
          ]),)
        ],
      ),
    );
  }
}
