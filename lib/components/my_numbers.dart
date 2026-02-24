import 'package:flutter/material.dart';
import 'package:new_mg_app/components/custom_top_bar/custom_top_bar.dart';

class MyNumbers extends StatelessWidget {
  const MyNumbers({super.key});

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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.car_crash),
                    const Text('Meus títulos'),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0D6EFD),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 30), //forçar o achatamento do botão. 0 é altura minima e 30 é a altura desejada
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
          ],
        ),
      ),
    );
  }
}
