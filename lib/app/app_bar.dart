import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      toolbarHeight: 92,
      leading: IconButton(
        icon: Icon(Icons.sort, color: Colors.white),
        onPressed: null,
      ),
      actions: [
        Column(
          children: [
            IconButton(icon: Icon(Icons.sms, color: Colors.white), onPressed: null),
            Text(
              'Suporte'
            )
          ],
        ),
      ],
      title: Image.asset('assets/icons/codetech.png', height: 60),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(92);
}
