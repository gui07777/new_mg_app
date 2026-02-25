import 'package:flutter/material.dart';
import 'package:new_mg_app/components/custom_top_bar/custom_top_bar.dart';
import 'dart:async';
import 'package:new_mg_app/components/carousel_campaign.dart';

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
                  const SizedBox(height: 12),
                  _buildListItem(
                    "A HORA DA SORTE 3",
                    "15/11/2025 às 17:36",
                    "0,01",
                  ),
                  _buildListItem(
                    "CAMPANHA TESTE DANIELA",
                    "10/12/2025 às 23:08",
                    "0,01",
                  ),
                  _buildListItem("HENRY", "14/03/2026 às 23:27", "0,01"),
                  _buildListItem(
                    "CAMPANHA DANIELA TESTE",
                    "07/02/2026 às 14:24",
                    "0,01",
                  ),
                  _buildListItem(
                    "CAMPANHA TESTE",
                    "10/12/2025 às 14:08",
                    "0,01",
                  ),
                  const SizedBox(height: 10),
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

                  _buildCurrentlyQuestions(
                    "Como acesso minhas compras?",
                    'Existem duas formas de você conseguir acessar suas compras, a primeira é logando no site, abrindo o menu do site e clicando em "Meus Títulos" e a segunda forma é visitando a campanha e clicando em "Ver meus títulos" logo a baixo das condições de participação.',
                  ),
                  _buildCurrentlyQuestions(
                    "Como é o processo do sorteio?",
                    'O sorteio será realizado com base na extração da Loteria Federal, conforme Condições de Participação constantes no título.',
                  ),
                  _buildCurrentlyQuestions(
                    " Onde o prêmio será entregue?",
                    'Não há necessidade de se preocupar com os trâmites relacionados à entrega do prêmio, pois nós cuidaremos de tudo.',
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String titulo, String data, String valor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/100/100',
                  width: 85,
                  height: 95,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titulo,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "R\$ $valor",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 6),
                          AnimatedOpacity(
                            opacity: _badgeOpacity,
                            duration: const Duration(milliseconds: 1000),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 49, 136, 51),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                "Adquira já",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            size: 14,
                            color: Color.fromARGB(255, 66, 65, 65),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            data,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 66, 65, 65),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentlyQuestions(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: ExpansionTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),

        title: Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        trailing: SizedBox.shrink(),
        leading: Icon(Icons.arrow_forward, size: 18),

        children: [
          ListTile(title: Text(subtitle, style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
