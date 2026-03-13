import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_mg_app/components/login_modal_component.dart';
import 'package:new_mg_app/components/register_modal_component.dart';
import 'package:new_mg_app/components/search_purchases_modal_component.dart';
import 'package:new_mg_app/constants/enums.dart';
import 'package:new_mg_app/providers/auth_provider.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String? routeName;
  final VoidCallback? onTap;

  MenuItem(this.title, this.icon, {this.routeName, this.onTap});
}


class NavigationModalComponent extends ConsumerWidget {
  const NavigationModalComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(authProvider);
    final bool isLogged = client != null;

    final List<MenuItem> menuItems = [
      MenuItem('Início', Icons.home_outlined, routeName: '/'),
      MenuItem('Afiliados', Icons.list_alt, routeName: '/affiliate'),
      MenuItem('Campanhas', Icons.list_alt, routeName: '/campaigns'),
      MenuItem('Comunicados', Icons.calendar_view_month, routeName: '/'),
      MenuItem('Meus títulos', Icons.whatshot, routeName: '/my-numbers'),
      MenuItem('Cadastro', Icons.account_circle_outlined, onTap: () => RegisterModalComponent.show(context, WhoCall.navigationModal)),
      MenuItem('Ganhadores', Icons.emoji_events_outlined, routeName: '/'),
      MenuItem('Meus giros', Icons.format_list_bulleted, routeName: '/award-roulette'),
      MenuItem('Raspadinhas', Icons.format_list_bulleted, routeName: '/'),
      MenuItem('Minhas caixas', Icons.format_list_bulleted, routeName: '/my-box'),
      MenuItem('Meu caça-níquel', Icons.format_list_bulleted, routeName: '/award-casino'),
      MenuItem('Termos de uso', Icons.description, routeName: '/'),
      MenuItem('Entrar em contato', Icons.mail_outline, routeName: '/'),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 36,
                right: 20,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/icons/codetech.png', height: 45),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 20,
                ),
                itemCount: menuItems.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.white10,
                  thickness: 1,
                  height: 1,
                ),
                itemBuilder: (context, item) {
                  return ListTile(
                    leading: Icon(
                      menuItems[item].icon,
                      color: Colors.white,
                      size: 20,
                    ),
                    title: Text(
                      menuItems[item].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      final route = menuItems[item].routeName;
                      final customCallBack = menuItems[item].onTap;
                      Navigator.pop(context);
                      if (customCallBack != null) {
                        customCallBack();
                      } else if (route != null && route.isNotEmpty) {
                        Navigator.pushNamed(context, route);
                      }
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    if (!isLogged) {
                      LoginModalComponent.show(
                        context,
                        WhoCall.navigationModal,
                      );
                    } else {
                      ref.read(authProvider.notifier).logout();
                    }
                  },
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: Text(
                    isLogged ? 'Sair' : 'Entrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
