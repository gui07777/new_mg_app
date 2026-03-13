import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_mg_app/components/select_draw_component.dart';
import 'package:new_mg_app/constants/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final TextEditingController _phoneController = TextEditingController();
  bool phoneBrl = true;

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
            Row(
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
            ),
            Divider(),
            SizedBox(height: 10),
            SelectDrawComponent(),
            Text(
              'Telefone',
              style: TextStyle(
                color: Color(0xFF454f5b),
                fontWeight: FontWeight.w500,
                fontSize: 13,
                height: 2.2,
              ),
            ),
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
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 32,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
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
            if (widget.origin == WhoCall.myNumbersPage)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Opacity(
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
                ),
              ),
            SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
