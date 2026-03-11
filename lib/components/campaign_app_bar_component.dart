import 'package:flutter/material.dart';
import 'package:new_mg_app/components/get_it_now_animation_component.dart';
import 'package:new_mg_app/components/login_modal_component.dart';
import 'package:new_mg_app/components/register_modal_component.dart';

class CampaignAppBarComponent extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onMenuPressed;
  final String title;

  const CampaignAppBarComponent({
    super.key,
    required this.imageUrl,
    required this.onMenuPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340.0,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      leadingWidth: 70,

      leading: IconButton(
        icon: const Icon(Icons.sort, color: Colors.white),
        onPressed: onMenuPressed,
      ),
      title: Image.asset('assets/icons/codetech.png', height: 60),
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
                  style: TextStyle(color: Color(0xFFFDFFA9), fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ],

      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground, // Faz a imagem dar zoom ao puxar
          StretchMode.fadeTitle, // Faz o conteúdo sumir suavemente
        ],
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        expandedTitleScale: 1.0,

        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(imageUrl, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [Colors.black54, Colors.transparent],
                  stops: [0.0, 0.5],
                ),
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Colors.black87, Colors.transparent],
                  stops: [0.0, 0.6],
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GetItNowAnimationComponent(),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Participe e concorra!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: InkWell(
                onTap:() {
                LoginModalComponent.show(context, WhoCall.campaignAppBar);
                },
                child: Container(
                  height: 30,
                  decoration: const BoxDecoration(color: Color(0xFF1A1A1A)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Meus títulos',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
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
