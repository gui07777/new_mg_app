import 'package:flutter/material.dart';
import 'package:new_mg_app/components/navigation_modal_component.dart';

class CustomTopBarComponent extends StatelessWidget {
  const CustomTopBarComponent({super.key});

  void _openMenu(BuildContext context) {
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const NavigationModalComponent();
      },
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

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      pinned: true,
      floating: true,
      snap: true,
      expandedHeight: 120.0,
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      leadingWidth: 70,
      leading: IconButton(
        icon: const Icon(Icons.sort, color: Colors.white),
        onPressed: () => _openMenu(context),
      ),
      title: Image.asset('assets/icons/codetech.png', height: 45),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () => {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.sms, color: Colors.white, size: 24),
                Text(
                  'Suporte',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ],

      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: const BoxDecoration(
                color: Colors.black,
                border: Border(top: BorderSide(color: Color(0xFFFFFFFF), width: 0.2)),
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.auto_awesome, color: Colors.amberAccent, size: 15),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/'),
                        style: TextButton.styleFrom(padding: EdgeInsets.all(2)),
                        child: const Text(
                          'Campanhas',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/my-numbers'),
                    child: const Text(
                      'Meus títulos',
                      style: TextStyle(color: Color(0xFFdedede), fontSize: 15),
                    ),
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
