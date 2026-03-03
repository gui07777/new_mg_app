import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum WhoCall { navigationModal, customTopBar, campaignDetails }

class LoginModalComponent extends StatelessWidget {
  final WhoCall origin;

  static const List<String> messages = [
    'Digite o número de telefone usado na hora da compra:',
    'Por favor, entre com seus dados ou faça um cadastro',
    '5 unidade(s) do produto RASPADINHA', //quantidade e produto mocados
  ];

  String getMessage() {
    switch (origin) {
      case WhoCall.navigationModal:
        return messages[0];
      case WhoCall.customTopBar:
        return messages[1];
      case WhoCall.campaignDetails:
        return messages[2];
    }
  }

  const LoginModalComponent({super.key, required this.origin});

  static Future<void> show(BuildContext context, WhoCall origin) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return LoginModalComponent(origin: origin);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String messageToShow = getMessage();
    final WhoCall switchCase = origin;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.95,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF212b36),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Divider(),
            Opacity(
              opacity: 0.9,
              child: Text(
                messageToShow,
                style: TextStyle(color: Color(0xFF495057)),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Informe seu telefone',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF212b36),
              ),
            ),
            TextField(
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 40,
                  maxHeight: 25,
                ),
                prefixIcon: const Icon(FontAwesomeIcons.whatsapp, size: 18),
                hintText: '(__) _____-____',
                hintStyle: const TextStyle(fontSize: 16),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 3.0),
                ),
              ),
            ),
            switchCase == WhoCall.campaignDetails
                ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFfff3cd),
                          border: Border.all(color: Color(0xFFFFE69C), width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline, size: 12),
                            SizedBox(width: 5),
                            Text(
                              'Informe seu telefone para continuar.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                )
                : Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Criar uma conta',
                        style: TextStyle(
                          color: Color(0xFF454f5b),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              width: double.infinity,
              height: 32,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continuar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward, size: 18, color: Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
