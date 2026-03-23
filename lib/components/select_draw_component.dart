import 'package:flutter/material.dart';
import 'package:new_mg_app/config/dio_client.dart';
import 'package:new_mg_app/models/campaign_model.dart';
import 'package:new_mg_app/services/campaign_service.dart';

class SelectDrawComponent extends StatefulWidget {
  const SelectDrawComponent({super.key});

  @override
  State<SelectDrawComponent> createState() => _SelectDrawComponentState();
}

class _SelectDrawComponentState extends State<SelectDrawComponent> {
  List<CampaignModel> campaigns = [];

  void initState() {
    super.initState();
    _fillDrawSelect();
  }

  Future<void> _fillDrawSelect() async {
    try {
      final campaignService = CampaignService(DioClient());
      final dynamic result = await campaignService.list();

      setState(() {
        campaigns = result;
      });
    } on Exception catch (e) {
      throw Exception('Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selecione o sorteio',
          style: TextStyle(
            color: Color(0xFF454f5b),
            fontWeight: FontWeight.w500,
            fontSize: 13,
            height: 2.2,
          ),
        ),
        Container(
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<CampaignModel>(
              padding: EdgeInsets.symmetric(horizontal: 6),
              isExpanded: true,
              hint: Text('Guilherme'),
              items: campaigns.map((campaign) {
                return DropdownMenuItem<CampaignModel>(
                  value: campaign,
                  child: Text(campaign.description),
                );
              }).toList(),
              onChanged: (CampaignModel? newValue) {
                setState(() {
                  
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
