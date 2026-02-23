import 'package:flutter/material.dart';
import 'package:new_mg_app/components/navigation_modal.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  void _openMenu(BuildContext context) {
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const NavigationModal();
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
      floating: false,
      elevation: 0,
      toolbarHeight: 80,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.sort, color: Colors.white),
        onPressed: () => _openMenu(context),
      ),
      title: Image.asset('assets/icons/codetech.png', height: 45),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
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
      ],
    );
  }
}
