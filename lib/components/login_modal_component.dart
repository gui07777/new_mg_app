// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_mg_app/config/dio_client.dart';
import 'package:new_mg_app/services/client_service.dart';

enum WhoCall { navigationModal, customTopBar, campaignDetails, campaignAppBar }

class AuthResponse {
  final String? accessToken;

  AuthResponse({this.accessToken});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(accessToken: json['accessToken']);
  }
}

class LoginModalComponent extends StatefulWidget {
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
  State<LoginModalComponent> createState() => _LoginModalComponentState();
}

class _LoginModalComponentState extends State<LoginModalComponent> {
  final TextEditingController _phoneController = TextEditingController();

  String getMessage() {
    switch (widget.origin) {
      case WhoCall.navigationModal:
        return LoginModalComponent.messages[0];
      case WhoCall.customTopBar:
        return LoginModalComponent.messages[1];
      case WhoCall.campaignDetails:
        return LoginModalComponent.messages[2];
      case WhoCall.campaignAppBar:
        return LoginModalComponent.messages[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    final String messageToShow = getMessage();
    final WhoCall switchCase = widget.origin;

    return Dialog(
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
            switchCase == WhoCall.campaignDetails
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
            switchCase == WhoCall.campaignDetails
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
                onPressed: () async {
                  String phone = _phoneController.text;
                  const storage = FlutterSecureStorage();

                  if (phone.isNotEmpty) {
                    final clientService = ClientService(DioClient());

                    final authData = await clientService.authenticateClient(
                      phone,
                    );

                    if (authData?.accessToken != null) {
                      await storage.write(
                        key: 'token',
                        value: authData!.accessToken,
                      );

                      final client = await clientService
                          .getClientByAuthenticated();

                      print('Sucesso! Cliente: $client');

                      // if (mounted) {
                      //   Navigator.pop(context);
                      // }
                    } else {
                      print(
                        'Token não recebido. Redirecionando para registro...',
                      );
                    }
                  }
                },
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
