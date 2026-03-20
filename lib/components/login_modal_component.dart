import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_mg_app/components/register_modal_component.dart';
import 'package:new_mg_app/config/dio_client.dart';
import 'package:new_mg_app/constants/enums.dart';
import 'package:new_mg_app/pages/affiliate_page.dart';
import 'package:new_mg_app/pages/award_casino_page.dart';
import 'package:new_mg_app/pages/award_roulette_page.dart';
import 'package:new_mg_app/pages/my_box_page.dart';
import 'package:new_mg_app/pages/my_numbers_page.dart';
import 'package:new_mg_app/pages/scratch_card_page.dart';
import 'package:new_mg_app/providers/auth_provider.dart';
import 'package:new_mg_app/services/client_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginModalComponent extends ConsumerStatefulWidget {
  final WhoCall origin;

  static const List<String> messages = [
    'Digite o número de telefone usado na hora da compra:',
    'Por favor, entre com seus dados ou faça um cadastro',
    '5 unidade(s) do produto RASPADINHA', //quantidade e produto mocados
  ];

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
  ConsumerState<LoginModalComponent> createState() =>
      _LoginModalComponentState();
}

class _LoginModalComponentState extends ConsumerState<LoginModalComponent> {
  final TextEditingController _phoneController = TextEditingController();
  bool phoneBrl = true;

  String getMessage() {
    if (widget.origin == WhoCall.navigationModalComponent ||
        widget.origin == WhoCall.registerModalComponent) {
      return LoginModalComponent.messages[0];
    } else if (widget.origin == WhoCall.customTopBarComponent) {
      return LoginModalComponent.messages[1];
    } else if (widget.origin == WhoCall.campaignDetailsPage) {
      return LoginModalComponent.messages[2];
    } else if (widget.origin == WhoCall.campaignAppBarComponent) {
      return LoginModalComponent.messages[1];
    } else {
      return 'Mensagem não disponível';
    }
  }

  Future<void> _sendAuthentication() async {
    String phone = _phoneController.text;
    const storage = FlutterSecureStorage();

    try {
      if (phone.isNotEmpty) {
        final clientService = ClientService(DioClient());

        final authDataByPhone = await clientService.authenticateClient(phone);

        await storage.write(key: 'token', value: authDataByPhone!.accessToken);

        final client = await clientService.getClientByAuthenticated();

        if (client.phone.length > 11) {
          client.phoneBrl = false;
        } else {
          client.phoneBrl = true;
        }

        ref.read(authProvider.notifier).setUser(client);

        if (mounted && widget.origin == WhoCall.navigationModalComponent) {
          Navigator.pop(context);
        } else if (widget.origin == WhoCall.customTopBarComponent ||
            widget.origin == WhoCall.campaignAppBarComponent) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyNumbersPage()),
          );
        } else if (widget.origin == WhoCall.affiliateButton) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AffiliatePage()),
          );
        } else if (widget.origin == WhoCall.myNumbersButton) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyNumbersPage()),
          );
        } else if (widget.origin == WhoCall.awardRouletteButton) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AwardRoulettePage()),
          );
        } else if (widget.origin == WhoCall.myBoxButton) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyBoxPage()),
          );
        } else if (widget.origin == WhoCall.awardCasinoButton) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AwardCasinoPage()),
          );
        } else if (widget.origin == WhoCall.scratchCardButton) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScratchCardPage()),
          );
        }
      }
    } on Exception catch (e) {
      throw Exception('Erro $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String messageToShow = getMessage();

    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.95,
        minWidth: MediaQuery.of(context).size.width * 0.95,
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
            widget.origin == WhoCall.campaignDetailsPage
                ? Text(
                    'Informe seu telefone',

                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF212b36),
                    ),
                  )
                : Container(),
            TextFormField(
              controller: _phoneController,
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
              validator: (value) {
                String? cleaned = value?.replaceAll(RegExp(r'\D'), '');

                RegExp regex = RegExp(r'^\d{10,11}$');

                if (cleaned == null || cleaned.isEmpty) {
                  return 'O telefone é obrigatório';
                } else if (!regex.hasMatch(cleaned)) {
                  return 'Número de telefone inválido';
                }
                return null;
              },

              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
              ],
            ),
            widget.origin == WhoCall.campaignDetailsPage
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFfff3cd),
                          border: Border.all(
                            color: Color(0xFFFFE69C),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 4,
                        ),
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
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        RegisterModalComponent.show(
                          context,
                          WhoCall.loginModalComponent,
                        );
                      },
                      child: Text(
                        'Criar uma conta',
                        style: TextStyle(
                          color: Color(0xFF454f5b),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
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
                onPressed: _sendAuthentication,
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
