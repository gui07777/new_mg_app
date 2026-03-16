import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:new_mg_app/components/description_regulation_component.dart';
import 'package:new_mg_app/components/login_modal_component.dart';
import 'package:new_mg_app/components/navigation_modal_component.dart';
import 'package:new_mg_app/components/campaign_app_bar_component.dart';
import 'package:new_mg_app/constants/enums.dart';

class CampaignDetailsPage extends StatefulWidget {
  final String imageUrl;
  final String title;

  const CampaignDetailsPage({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  State<CampaignDetailsPage> createState() => _CampaignDetailsPageState();
}

class _CampaignDetailsPageState extends State<CampaignDetailsPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            CampaignAppBarComponent(
              imageUrl: widget.imageUrl,
              onMenuPressed: () => _openMenu(context),
              title: widget.title,
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sorteio',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '01/08/2026',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Por apenas ',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'R\$ 0,01',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(3),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        'Quanto mais títulos, mais chances de ganhar!',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 5),

                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        _buildSelectButton(),
                        _buildSelectButton(),
                        _buildSelectButton(),
                        _buildSelectButton(),
                        _buildSelectButton(),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () => setState(
                                    () => _quantity > 1 ? _quantity-- : null,
                                  ),
                                ),
                                Text(
                                  '$_quantity',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Color(0xFF002F6C),
                                  ),
                                  onPressed: () => setState(() => _quantity++),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: InkWell(
                            child: SizedBox(
                              height: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF198754),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        BootstrapIcons.arrow_right_square_fill,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Participar',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              height: 1.8,
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.75,
                                            child: Text(
                                              'R\$ 0,0$_quantity',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFFFFFFFF),
                                                height: 0.4,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              LoginModalComponent.show(
                                context,
                                WhoCall.campaignDetails,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      runSpacing: 6,
                      children: [
                        _buildCombos(),
                        _buildCombos(),
                        _buildCombos(),
                      ],
                    ),
                    const SizedBox(height: 5),
                    DescriptionRegulationComponent(
                      description: 'Raspadinha',
                      prizes: '+ Prêmio - R\$0,01',
                    ),
                    const SizedBox(height: 50),
                    Wrap(
                      runSpacing: 5,
                      children: [
                        _buildGreenCardPrizeName(),
                        _buildGreenCardPrizeDetails(),
                        _buildSeeMoreButton(),
                      ],
                    ),
                    const SizedBox(height: 45),
                    Row(
                      children: [
                        Text(
                          'Raspadinhas🎴',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'prêmios instantâneos',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xFF38A144), Color(0xFF02C6D1)],
                                stops: [0.0, 1.0],
                              ),
                            ),
                            child: Text(
                              'Disponíveis: 5',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xFFA23839), Color(0xFFE25A8B)],
                                stops: [0.0, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'Sorteados: 0',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    _buildPrizeStatus('PREMIO', 'Disponível'),
                    _buildPrizeStatus('PREMIO', 'Disponível'),
                    _buildPrizeStatus('PREMIO', 'Disponível'),
                    _buildPrizeStatus('PREMIO', 'Disponível'),
                    _buildPrizeStatus('PREMIO', 'Disponível'),
                    _buildPrizeStatus('PREMIO', 'Disponível'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openMenu(BuildContext context) {
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const NavigationModalComponent(),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, -1), end: Offset.zero).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
    );
  }

  Widget _buildPrizeStatus(String prizeName, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(3),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              prizeName,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF171717),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              status,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF171717),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectButton() {
    return InkWell(
      onTap: () {
        setState(() {
          _quantity++;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF00307A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: const [
            Text(
              '+1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'SELECIONAR',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCombos() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFA23839), Color(0xFFE25A8B)],
          stops: [0.0, 1.0],
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '2 Títulos',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Opacity(
                opacity: 0.75,
                child: Text(
                  'por R\$ 0,02',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                    height: 0.4,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Recebe:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                '2 Caixas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 0.4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGreenCardPrizeName() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFF1bee43),
      ),
      child: Text(
        'Menor e Maior Título',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildGreenCardPrizeDetails() {
    return Container(
      height: 150,
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF1BEE43),
            const Color(0xFF03350C).withOpacity(0.294),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      child: Column(
        spacing: 18,
        children: [
          Text(
            'teste',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.4),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text('Vencedor: Dani Título: 461003'),
          ),
          Text(
            'teste',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeeMoreButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF198754),
        minimumSize: Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
      ),
      onPressed: () {},
      child: Text(
        'Ver mais',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
