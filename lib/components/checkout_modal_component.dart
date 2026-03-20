import 'package:flutter/material.dart';

class CheckoutModalComponent extends StatelessWidget {
  const CheckoutModalComponent({super.key});

  static void show(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const CheckoutModalComponent(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Checkout',
          style: TextStyle(color: Color(0xFF4A4A4A), fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Color(0xFF4A4A4A)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFDDE9FF),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFB8D1FF)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, size: 18, color: Color(0xFF5A5A5A)),
                  const SizedBox(width: 8),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Color(0xFF5A5A5A), fontSize: 14),
                      children: [
                        TextSpan(text: '1 unidade ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'do produto '),
                        TextSpan(text: 'Raspadinha', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Icon(Icons.no_photography_outlined, color: Colors.grey.shade400),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 15),
                          children: [
                            TextSpan(text: 'Nome: ', style: TextStyle(color: Colors.blueAccent)),
                            TextSpan(text: 'Dani Dani', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 15),
                          children: [
                            TextSpan(text: 'Telefone: ', style: TextStyle(color: Colors.blueAccent)),
                            TextSpan(text: '(11) 11111-****', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Ao realizar este pagamento e confirmar minha compra, declaro ter lido e concordado com os termos anexados na página do sorteio.',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B8753),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Concluir Reserva',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_circle_right_outlined, color: Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextButton(
              onPressed: () {},
              child: const Text(
                'Utilizar outra conta',
                style: TextStyle(color: Color(0xFF5A5A5A), fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}