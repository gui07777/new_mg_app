import 'package:flutter/material.dart';
import 'package:new_mg_app/pages/affiliate_page.dart';
import 'package:new_mg_app/pages/award_casino_page.dart';
import 'package:new_mg_app/pages/award_roulette_page.dart';
import 'package:new_mg_app/pages/campaigns_page.dart';
import 'package:new_mg_app/pages/home_page.dart';
import 'package:new_mg_app/pages/my_box_page.dart';
import 'package:new_mg_app/pages/my_numbers_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/my-numbers': (context) => const MyNumbersPage(),
        '/campaigns': (context) => const CampaignsPage(),
        '/affiliate': (context) => const AffiliatePage(),
        '/award-roulette': (context) => const AwardRoulettePage(),
        '/my-box': (context) => const MyBoxPage(),
        '/award-casino': (context) => const AwardCasinoPage(),
      },
      theme: ThemeData(fontFamily: 'Montserrat', useMaterial3: true),
    );
  }
}
