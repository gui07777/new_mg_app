import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_mg_app/components/login_modal_component.dart';
import 'package:new_mg_app/components/register_modal_component.dart';
import 'package:new_mg_app/constants/enums.dart';
import 'package:new_mg_app/pages/affiliate_page.dart';
import 'package:new_mg_app/pages/award_casino_page.dart';
import 'package:new_mg_app/pages/award_roulette_page.dart';
import 'package:new_mg_app/pages/campaigns_page.dart';
import 'package:new_mg_app/pages/my_box_page.dart';
import 'package:new_mg_app/pages/my_numbers_page.dart';
import 'package:new_mg_app/pages/scratch_card_page.dart';
import 'package:new_mg_app/providers/auth_provider.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String? routeName;
  final VoidCallback? onTap;
  final Widget? destinationPage;

  MenuItem(
    this.title,
    this.icon, {
    this.routeName,
    this.onTap,
    this.destinationPage,
  });
}

class NavigationModalComponent extends ConsumerWidget {
  const NavigationModalComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(authProvider); // retorna o estado atual do provider (deslogado retorna null, logado retorna uma instância do ClientModel)
    print('client: $client');
    final bool isLogged = client != null; // define validação pra ver se o usuário ta logado

    final List<MenuItem> menuItems = [
      MenuItem('Início', Icons.home_outlined, routeName: '/'),
      MenuItem(
        'Afiliados',
        Icons.list_alt,
        onTap: () => LoginModalComponent.show(context, WhoCall.affiliateButton),
        destinationPage: AffiliatePage(),
      ),
      MenuItem(
        'Campanhas',
        Icons.list_alt,
        routeName: '/campaigns',
        destinationPage: CampaignsPage(),
      ),
      MenuItem('Comunicados', Icons.calendar_view_month, routeName: '/'),
      MenuItem(
        'Meus títulos',
        Icons.whatshot,
        onTap: () => LoginModalComponent.show(context, WhoCall.myNumbersButton),
        destinationPage: MyNumbersPage(),
      ),
      MenuItem(
        'Cadastro',
        Icons.account_circle_outlined,
        onTap: () => RegisterModalComponent.show(
          context,
          WhoCall.navigationModalComponent,
        ),
      ),
      MenuItem(
        'Ganhadores',
        Icons.emoji_events_outlined,
        routeName: '/campaigns',
        destinationPage: CampaignsPage(),
      ),
      MenuItem(
        'Meus giros',
        Icons.format_list_bulleted,
        onTap: () =>
            LoginModalComponent.show(context, WhoCall.awardRouletteButton),
        destinationPage: AwardRoulettePage(),
      ),
      MenuItem(
        'Raspadinhas',
        Icons.format_list_bulleted,
        onTap: () =>
            LoginModalComponent.show(context, WhoCall.scratchCardButton),
            destinationPage: ScratchCardPage()
      ),
      MenuItem(
        'Minhas caixas',
        Icons.format_list_bulleted,
        onTap: () => LoginModalComponent.show(context, WhoCall.myBoxButton),
        destinationPage: MyBoxPage(),
      ),
      MenuItem(
        'Meu caça-níquel',
        Icons.format_list_bulleted,
        onTap: () =>
            LoginModalComponent.show(context, WhoCall.awardCasinoButton),
        destinationPage: AwardCasinoPage(),
      ),
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
                      final items = menuItems[item];
                      Navigator.pop(context);

                      if (isLogged) {
                        if (items.destinationPage != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => items.destinationPage!,
                            ),
                          );
                        } else if (items.routeName != null) {
                          Navigator.pushNamed(context, items.routeName!);
                        }
                      } else {
                        if (items.onTap != null) {
                          items.onTap!();
                        } else if (items.routeName != null) {
                          Navigator.pushNamed(context, items.routeName!);
                        }
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
                        WhoCall.navigationModalComponent,
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
