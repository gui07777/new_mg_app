import 'package:flutter/material.dart';
import 'package:new_mg_app/components/campaign_cards_component.dart';
import 'package:new_mg_app/components/custom_top_bar_component.dart';

class CampaignsPage extends StatefulWidget {
  const CampaignsPage({super.key});

  @override
  State<CampaignsPage> createState() => _CampaignsState();
}

class _CampaignsState extends State<CampaignsPage> {
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
              child: Container(height: 1, color: Colors.grey[800]),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(Icons.bolt, color: Colors.deepOrangeAccent),
                        const SizedBox(width: 5),
                        Row(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              'Campanhas',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Escolha sua sorte',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CampaignCardsComponent(
                    titulo: "A HORA DA SORTE 3",
                    data: "15/11",
                    valor: "0,01",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CampaignCardsComponent(
                    titulo: "A HORA DA SORTE 3",
                    data: "15/11",
                    valor: "0,01",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CampaignCardsComponent(
                    titulo: "A HORA DA SORTE 3",
                    data: "15/11",
                    valor: "0,01",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CampaignCardsComponent(
                    titulo: "A HORA DA SORTE 3",
                    data: "15/11",
                    valor: "0,01",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CampaignCardsComponent(
                    titulo: "A HORA DA SORTE 3",
                    data: "15/11",
                    valor: "0,01",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CampaignCardsComponent(
                    titulo: "A HORA DA SORTE 3",
                    data: "15/11",
                    valor: "0,01",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CampaignCardsComponent(
                    titulo: "A HORA DA SORTE 3",
                    data: "15/11",
                    valor: "0,01",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
