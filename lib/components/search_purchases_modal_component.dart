import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:new_mg_app/components/select_draw_component.dart';
import 'package:new_mg_app/config/dio_client.dart';
import 'package:new_mg_app/constants/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_mg_app/models/campaign_model.dart';
import 'package:new_mg_app/providers/campaign_provider.dart';
import 'package:new_mg_app/services/campaign_service.dart';
import 'package:new_mg_app/services/sale_service.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SearchPurchasesModalComponent extends ConsumerStatefulWidget {
  final WhoCall origin;

  const SearchPurchasesModalComponent({super.key, required this.origin});

  static Future<void> show(BuildContext context, WhoCall origin) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SearchPurchasesModalComponent(origin: origin);
      },
    );
  }

  @override
  ConsumerState<SearchPurchasesModalComponent> createState() =>
      _SearchPurchasesModalComponentState();
}

class _SearchPurchasesModalComponentState
    extends ConsumerState<SearchPurchasesModalComponent> {
  final saleService = SaleService(DioClient());
  final campaignService = CampaignService(DioClient());
  final TextEditingController _phoneController = TextEditingController();
  bool phoneBrl = true;
  List<CampaignModel?> allCampaings = [];

  bool get _isPhoneValid {
    final digits = _phoneController.text.replaceAll(RegExp(r'\D'), '');
    return digits.length >= 10;
  }

  final maskFormatter = MaskTextInputFormatter(
    mask: '(__) _____-____',
    filter: {'_': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  Future<void> _handleSearch() async {
    final selectedCampaign = ref.read(selectedCampaignProvider);
    if (selectedCampaign == null) return;

    try {
      final response = await saleService.listByClientAndCampaign(
        selectedCampaign.id,
      );

      if (!context.mounted) return;

      Navigator.pop(context);
      Navigator.pushNamed(context, '/my-numbers', arguments: response ?? []);
    } catch (e) {
      throw Exception('erro ao buscar campanhas $e');
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
            SizedBox(height: 10),
            SelectDrawComponent(),
            SizedBox(height: 16),
            _buildPhoneField(),
            SizedBox(height: 20),
            _buildFooterActions(),
            SizedBox(height: 20),
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
          'Buscar compras',
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

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Telefone',
          style: TextStyle(
            color: Color(0xFF454f5b),
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            prefixIcon: const Icon(FontAwesomeIcons.whatsapp, size: 18),
            hintText: '(__) _____-____',
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 12,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 40,
              maxHeight: 25,
            ),
          ),
          inputFormatters: [maskFormatter],
        ),
      ],
    );
  }

  Widget _buildFooterActions() {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _phoneController,
      builder: (context, value, child) {
        final bool isValid = _isPhoneValid;
        return Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 32,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isValid
                        ? Colors.blueAccent
                        : Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: isValid ? _handleSearch : null,
                  child: Text(
                    'Buscar compras',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            if (!isValid) Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: _buildWarningCard(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildWarningCard() {
    return Opacity(
      opacity: 0.9,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFfff3cd),
          border: Border.all(color: Color(0xFFFFE69C), width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(Icons.warning_amber_rounded, size: 18),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                'Preencha os campos para localizar suas compras.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
