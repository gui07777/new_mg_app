import 'package:flutter/material.dart';
import 'package:new_mg_app/components/campaign_cards.dart';
import 'package:new_mg_app/components/custom_top_bar.dart';
import 'dart:async';
import 'package:new_mg_app/components/carousel_campaign.dart';
import 'package:new_mg_app/components/frequently_questions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _badgeOpacity = 1.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      if (mounted) {
        setState(() {
          _badgeOpacity = _badgeOpacity == 1.0 ? 0.0 : 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            CustomTopBar(),
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
                  CarouselCampaign(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CampaignCards(
                    titulo: "A HORA DA SORTE 3",
                    data: "15/11/2025 às 17:36",
                    valor: "0,01",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CampaignCards(
                    titulo: "A HORA DA SORTE 3",
                    data: "15/11/2025 às 17:36",
                    valor: "0,01",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CampaignCards(
                    titulo: "A HORA DA SORTE 3",
                    data: "15/11/2025 às 17:36",
                    valor: "0,01",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CampaignCards(
                    titulo: "A HORA DA SORTE 3",
                    data: "15/11/2025 às 17:36",
                    valor: "0,01",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Text(
                          "🤷 Perguntas frequentes",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 5)),

                  FrequentlyQuestions(
                    title: "Como acesso minhas compras?",
                    subtitle: 'Existem duas formas de você conseguir acessar suas compras, a primeira é logando no site, abrindo o menu do site e clicando em "Meus Títulos" e a segunda forma é visitando a campanha e clicando em "Ver meus títulos" logo a baixo das condições de participação.',
                  ),
                  FrequentlyQuestions(
                    title: "Como é o processo do sorteio?",
                    subtitle: 'O sorteio será realizado com base na extração da Loteria Federal, conforme Condições de Participação constantes no título.',
                  ),
                  FrequentlyQuestions(
                    title: " Onde o prêmio será entregue?",
                    subtitle: 'Não há necessidade de se preocupar com os trâmites relacionados à entrega do prêmio, pois nós cuidaremos de tudo.',
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