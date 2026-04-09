import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_mg_app/config/dio_client.dart';
import 'package:new_mg_app/models/campaign_model.dart';
import 'package:new_mg_app/services/campaign_service.dart';

class CarouselCampaignComponent extends StatefulWidget {
  const CarouselCampaignComponent({super.key});

  @override
  State<CarouselCampaignComponent> createState() => _CarouselCampaignState();
}

class _CarouselCampaignState extends State<CarouselCampaignComponent> {
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

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                ),
                items: campaigns.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                child: i.imgMobile == null || i.imgMobile!.isEmpty
                                    ? _buildNoImageContainer()
                                    : Image.network(
                                        i.imgMobile.toString(),
                                        fit: BoxFit.cover,
                                        // height: 350,
                                        cacheWidth: 300,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                _buildNoImageContainer(),
                                      ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    i.description,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF333333),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Participe e concorra!',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Positioned(
              left: 16,
              child: IconButton(
                onPressed: () => _controller.previousPage(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
            Positioned(
              right: 10,
              child: IconButton(
                onPressed: () => _controller.nextPage(),
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ],
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
