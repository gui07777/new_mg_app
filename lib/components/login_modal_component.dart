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
  bool _isLoading = false;
  bool phoneBrl = true;

  String get _displayMessage {
    switch (widget.origin) {
      case WhoCall.navigationModalComponent:
      case WhoCall.registerModalComponent:
        return 'Digite o número de telefone usado na hora da compra:';
      case WhoCall.campaignDetailsPage:
        return '5 unidade(s) do produto RASPADINHA';
      default:
        return 'Por favor, entre com seus dados ou faça um cadastro';
    }
  }

  void _handleNavigation() {
    if (!mounted) return;

    if (widget.origin == WhoCall.navigationModalComponent) {
      Navigator.pop(context);
      return;
    }

    final routes = {
      WhoCall.customTopBarComponent: const MyNumbersPage(),
      WhoCall.campaignAppBarComponent: const MyNumbersPage(),
      WhoCall.myNumbersButton: const MyNumbersPage(),
      WhoCall.affiliateButton: const AffiliatePage(),
      WhoCall.awardRouletteButton: const AwardRoulettePage(),
      WhoCall.myBoxButton: const MyBoxPage(),
      WhoCall.awardCasinoButton: const AwardCasinoPage(),
      WhoCall.scratchCardButton: const ScratchCardPage(),
    };

    final destination = routes[widget.origin];

    if (destination != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => destination),
      );
    }
  }

  Future<void> _authenticate() async {
    String phone = _phoneController.text;

    if (phone.isEmpty) return;
    try {
      final clientService = ClientService(DioClient());
      final authDataByPhone = await clientService.authenticateClient(phone);

      if (authDataByPhone != null && authDataByPhone.accessToken != null) {
        const storage = FlutterSecureStorage();
        await storage.write(key: 'token', value: authDataByPhone.accessToken);

        final client = await clientService.getClientByAuthenticated();

        if (client != null) {
          // Lógica de negócio original
          client.phoneBrl = client.phone.length <= 11;

          if (!mounted) return;
          ref.read(authProvider.notifier).setUser(client);

          _handleNavigation();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Erro ao autenticar: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            _buildHeader(),
            Divider(),
            Opacity(
              opacity: 0.9,
              child: Text(
                _displayMessage,
                style: TextStyle(color: Color(0xFF495057)),
              ),
            ),
            SizedBox(height: 10),
            if (widget.origin == WhoCall.campaignDetailsPage)
              _buildCampaignLabel(),
            _buildPhoneField(),
            _buildFooterActions(),
            const SizedBox(height: 8),
            _buildSubmitButton(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
    );
  }

  Widget _buildCampaignLabel() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        'Informe seu telefone',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
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
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
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
    );
  }

  Widget _buildFooterActions() {
    if (widget.origin == WhoCall.campaignDetailsPage) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFfff3cd),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xFFFFE69C)),
        ),
        child: const Row(
          children: [
            Icon(Icons.info_outline, size: 14),
            SizedBox(width: 8),
            Text(
              'Informe seu telefone para continuar.',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      );
    }

    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
          RegisterModalComponent.show(context, WhoCall.loginModalComponent);
        },
        child: const Text(
          'Criar uma conta',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: _authenticate,
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
    );
  }
}
