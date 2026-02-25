import 'package:flutter/material.dart';
import 'package:new_mg_app/components/custom_top_bar.dart';
import 'package:new_mg_app/components/my_number_card.dart';

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
                      onPressed: () {},
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
            SliverToBoxAdapter(
              child: MyNumbersCard(
                name: 'Dani Dani',
                phone: '(11) 11111-1111',
                date: '16/01/2026 - 11:12h',
                value: '0.07',
                status: 'Confirmado',
                totalQuantity: '8',
              ),
            ),
            SliverToBoxAdapter(
              child: MyNumbersCard(
                name: 'Dani Dani',
                phone: '(11) 11111-1111',
                date: '16/01/2026 - 11:12h',
                value: '0.07',
                status: 'Confirmado',
                totalQuantity: '8',
              ),
            ),
            SliverToBoxAdapter(
              child: MyNumbersCard(
                name: 'Dani Dani',
                phone: '(11) 11111-1111',
                date: '16/01/2026 - 11:12h',
                value: '0.07',
                status: 'Confirmado',
                totalQuantity: '8',
              ),
            ),
            SliverToBoxAdapter(
              child: MyNumbersCard(
                name: 'Dani Dani',
                phone: '(11) 11111-1111',
                date: '16/01/2026 - 11:12h',
                value: '0.07',
                status: 'Confirmado',
                totalQuantity: '8',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildNumbers(
  //   String name,
  //   String phone,
  //   String date,
  //   String value,
  //   String status,
  //   String totalQuantity,
  // ) {
  //   return Padding(
  //     padding: const EdgeInsets.all(12.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: Colors.white,
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(12.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 Text(
  //                   'Nome:',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //                 Text(
  //                   name,
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Text(
  //                   'Telefone:',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //                 Text(
  //                   phone,
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Text(
  //                   'Data:',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //                 Text(
  //                   date,
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Text(
  //                   'Valor:',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //                 Text(
  //                   value,
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Text(
  //                   'Status:',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //                 Text(
  //                   status,
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Text(
  //                   'Quantidade total:',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //                 Text(
  //                   totalQuantity,
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Text(
  //                   'Ações:',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xFF212b36),
  //                   ),
  //                 ),
  //                 TextButton(
  //                   onPressed: () {},
  //                   child: InkWell(
  //                     onTap: () {},
  //                     child: Row(
  //                       children: [
  //                         Icon(Icons.print, color: Color(0xFF212b36)),
  //                         Text(
  //                           'Ver títulos',
  //                           style: TextStyle(
  //                             fontSize: 13,
  //                             fontWeight: FontWeight.w600,
  //                             color: Color(0xFF212b36),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //                 TextButton(
  //                   onPressed: () {},
  //                   child: InkWell(
  //                     child: Row(
  //                       children: [
  //                         Icon(Icons.print, color: Color(0xFF212b36)),
  //                         Text(
  //                           'Ver jogos',
  //                           style: TextStyle(
  //                             fontSize: 13,
  //                             fontWeight: FontWeight.w600,
  //                             color: Color(0xFF212b36),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
