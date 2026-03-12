import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_mg_app/components/login_modal_component.dart';
import 'package:new_mg_app/components/register_modal_component.dart';
import 'package:new_mg_app/config/dio_client.dart';
import 'package:new_mg_app/constants/enums.dart';
import 'package:new_mg_app/pages/my_numbers_page.dart';
import 'package:new_mg_app/providers/auth_provider.dart';
import 'package:new_mg_app/services/client_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class RegisterModalComponent extends ConsumerStatefulWidget {
  final WhoCall origin;

  const RegisterModalComponent({super.key, required this.origin});

  static Future<void> show(BuildContext context, WhoCall origin) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return RegisterModalComponent(origin: origin);
      },
    );
  }

  @override
  ConsumerState<RegisterModalComponent> createState() =>
      _RegisterModalComponentState();
}

class _RegisterModalComponentState
    extends ConsumerState<RegisterModalComponent> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _socialNameController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPhoneController = TextEditingController();
  bool phoneBrl = true;

  @override
  Widget build(BuildContext context) {
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
                  'Registro',
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
                'Preencha os campos abaixo:',
                style: TextStyle(color: Color(0xFF495057)),
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome completo',
                  style: TextStyle(
                    color: Color(0xFF212b36),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    height: 2.5,
                  ),
                ),
                TextFormField(
                  controller: _fullNameController,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Nome Completo',
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
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 3.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (_fullNameController.text.isEmpty) {
                      return 'O nome é obrigatório';
                    }
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome social',
                  style: TextStyle(
                    color: Color(0xFF212b36),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    height: 2.5,
                  ),
                ),
                TextFormField(
                  controller: _socialNameController,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Nome Social',
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
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 3.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (_socialNameController.text.isEmpty) {
                      return 'O nome social é obrigatório';
                    }
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CPF',
                  style: TextStyle(
                    color: Color(0xFF212b36),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    height: 2.5,
                  ),
                ),
                TextFormField(
                  controller: _cpfController,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '___.___.___-__',
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
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 3.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    String? cleaned = value?.replaceAll(RegExp(r'\D'), '');

                    RegExp regex = RegExp(r'^\d{11}$');

                    if (cleaned == null || cleaned.isEmpty) {
                      return 'O CPF é obrigatório';
                    } else if (!regex.hasMatch(cleaned)) {
                      return 'Número de CPF inválido';
                    }
                    return null;
                  },

                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data de nascimento',
                  style: TextStyle(
                    color: Color(0xFF212b36),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    height: 2.5,
                  ),
                ),
                TextFormField(
                  controller: _birthDateController,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '__/__/____',
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
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 3.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    String? cleaned = value?.replaceAll(RegExp(r'\D'), '');

                    RegExp regex = RegExp(r'^\d{8}$');

                    if (cleaned == null || cleaned.isEmpty) {
                      return 'A data de nascimento é obrigatória';
                    } else if (!regex.hasMatch(cleaned)) {
                      return 'Data de nascimento inválida';
                    }
                    return null;
                  },

                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(8),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Telefone',
                  style: TextStyle(
                    color: Color(0xFF212b36),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    height: 2.5,
                  ),
                ),
                TextFormField(
                  controller: _phoneController,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
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
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 3.0,
                      ),
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Confirmar telefone',
                  style: TextStyle(
                    color: Color(0xFF212b36),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    height: 2.5,
                  ),
                ),
                TextFormField(
                  controller: _confirmPhoneController,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
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
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 3.0,
                      ),
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
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  LoginModalComponent.show(context, WhoCall.registerModalComponent);
                },
                child: Text(
                  'Já possuo uma conta',
                  style: TextStyle(
                    color: Color(0xFF454f5b),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            Text(
              'Ao clicar em finalizar, você está de acordo com o regulamento do sorteio.',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            ),
            SizedBox(height: 12),
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

                    final authDataByPhone = await clientService
                        .authenticateClient(phone);

                    await storage.write(
                      key: 'token',
                      value: authDataByPhone!.accessToken,
                    );

                    final client = await clientService
                        .getClientByAuthenticated();

                    if (client.phone.length > 11) {
                      client.phoneBrl = false;
                    } else {
                      client.phoneBrl = true;
                    }

                    ref.read(authProvider.notifier).setUser(client);

                    if (mounted && widget.origin == WhoCall.navigationModal) {
                      Navigator.pop(context);
                    } else if (widget.origin == WhoCall.customTopBar ||
                        widget.origin == WhoCall.campaignAppBar) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyNumbersPage(),
                        ),
                      );
                    } else if (widget.origin == WhoCall.campaignDetails) {
                      // rota indefinida
                    }
                  }
                },
                child: Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
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
