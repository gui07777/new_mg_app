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
  CampaignModel? selectedCampaign;

  @override
  void initState() {
    super.initState();
    _loadCampaigns();
  }

  Future<void> _loadCampaigns() async {
    try {
      final campaignService = CampaignService(DioClient());
      final dynamic result = await campaignService.list();

      setState(() {
        campaigns = result;
      });
    } on Exception catch (e) {
      throw Exception('Erro ao carregar campanhas: $e');
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
              value: selectedCampaign,
              padding: EdgeInsets.symmetric(horizontal: 6),
              isExpanded: true,
              hint: Text('Selecione'),
              items: campaigns.map((campaign) {
                return DropdownMenuItem<CampaignModel>(
                  value: campaign,
                  child: Text(campaign.description),
                );
              }).toList(),
              // quando é clicado em algum item do select, o onChnaged detecta qual foi clicado e coloca dentro do argumento que eu nomeei como newValue, daí consigo colcoar esse valor na variável de estado selectedCampaign
              onChanged: (CampaignModel? newValue) {
                setState(() {
                  selectedCampaign = newValue;

                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
