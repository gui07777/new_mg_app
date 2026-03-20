import 'package:flutter/material.dart';
import 'package:new_mg_app/components/black_container_information_component.dart';
import 'package:new_mg_app/components/custom_top_bar_component.dart';
import 'package:new_mg_app/components/select_draw_component.dart';
import 'package:new_mg_app/components/warning_container_component.dart';

class AwardRoulettePage extends StatelessWidget {
  const AwardRoulettePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CustomTopBarComponent(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ROLETAS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  BlackContainerInformationComponent(information: 'Gire a roleta e concorra a prêmios exclusivos!'),
                  SizedBox(height: 10),
                  SelectDrawComponent(),
                  SizedBox(height: 15),
                  WarningContainerComponent(
                    information: 'Você ainda não tem giros na roleta!',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
