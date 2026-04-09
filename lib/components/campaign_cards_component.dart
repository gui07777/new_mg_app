import 'package:flutter/material.dart';
import 'package:new_mg_app/components/get_it_now_animation_component.dart';
import 'package:new_mg_app/config/dio_client.dart';
import 'package:new_mg_app/models/campaign_model.dart';
import 'package:new_mg_app/pages/campaign_details_page.dart';
import 'package:new_mg_app/services/campaign_service.dart';

class CampaignCardsComponent extends StatefulWidget {
  const CampaignCardsComponent({super.key});

  @override
  State<CampaignCardsComponent> createState() => _CampaignCardsState();
}

class _CampaignCardsState extends State<CampaignCardsComponent> {
  List<CampaignModel> campaigns = [];

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
    return ListView.builder(
      padding: EdgeInsets.all(5),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: campaigns.length,
      itemBuilder: (context, index) {
        final campaign = campaigns[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CampaignDetailsPage(
                    title: campaign.title,
                    imageUrl:
                        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                  ),
                ),
              );
            },
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                        campaign.imgMobile == null ||
                            campaign.imgMobile!.isEmpty
                        ? _buildNoImageContainer()
                        : Image.network(
                            campaign.imgMobile!,
                            width: 85,
                            height: 95,
                            fit: BoxFit.cover,
                            cacheWidth: 300,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildNoImageContainer(),
                          ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 85,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                campaign.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "R\$ ${campaign.ticketValue}",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 6),
                              GetItNowAnimationComponent(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.calendar_month_outlined,
                                size: 14,
                                color: Color.fromARGB(255, 66, 65, 65),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${campaign.deadlineDate.day.toString().padLeft(2, '0')}/${campaign.deadlineDate.month.toString().padLeft(2, '0')}/${campaign.deadlineDate.year} às ${campaign.deadlineDate.hour.toString().padLeft(2, '0')}:${campaign.deadlineDate.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 66, 65, 65),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNoImageContainer() {
    return Container(
      width: 85,
      height: 95,
      color: Colors.grey[200],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_not_supported_outlined,
            color: Colors.black38,
            size: 24,
          ),
          SizedBox(height: 4),
          Text(
            'Sem foto',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black38,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
