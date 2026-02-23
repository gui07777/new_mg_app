import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String routeName;

  MenuItem(this.title, this.icon, this.routeName);
}

class NavigationModal extends StatelessWidget {
  const NavigationModal({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem('Início', Icons.home_outlined, '/'),
      MenuItem('Afiliados', Icons.list_alt, '/afiliados'),
      MenuItem('Campanhas', Icons.list_alt, '/campanhas'),
      MenuItem('Comunicados', Icons.calendar_view_month, '/rota'),
      MenuItem('Meus títulos', Icons.whatshot, '/rota'),
      MenuItem('Cadastro', Icons.account_circle_outlined, '/rota'),
      MenuItem('Ganhadores', Icons.emoji_events_outlined, '/rota'),
      MenuItem('Meus giros', Icons.format_list_bulleted, ''),
      MenuItem('Raspadinhas', Icons.format_list_bulleted, '/rota'),
      MenuItem('Minhas caixas', Icons.format_list_bulleted, '/rota'),
      MenuItem('Meu caça-níquel', Icons.format_list_bulleted, '/rota'),
      MenuItem('Termos de uso', Icons.description, '/rota'),
      MenuItem('Entrar em contato', Icons.mail_outline, '/rota'),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 36, right: 20, top: 10, bottom: 10),
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
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      menuItems[index].icon,
                      color: Colors.white,
                      size: 20,
                    ),
                    title: Text(
                      menuItems[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, menuItems[index].routeName);
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
                  onPressed: () {},
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    'Sair',
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
