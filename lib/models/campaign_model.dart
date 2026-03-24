import 'package:new_mg_app/constants/campaign_modality_enum.dart';
import 'package:new_mg_app/constants/campaign_status_enum.dart';

class CampaignModel {
  final String title;
  final String description;
  final CampaignStatusEnum status;
  final String imgDesktop;
  final String imgMobile;
  final String? susep;
  final CampaignModalityEnum modality;
  final DateTime drawDate;
  final DateTime deadlineDate;
  final int totalTickets;
  final int minBuyTickets;
  final int maxBuyTickets;
  final double ticketValue;
  final bool showDrawDate;
  final String showAdicionalInfo;
  final List<int> numbersQuantityButton;
  final List<CampaignPrizesModel> prizes;
  final int expirationQrCode;
  final String url;
  final bool checkAvailableNumbers;
  final String generalConditions;
  final String regulation;
  final String availabilityLabel;
  final int? salesCount;

  CampaignModel({
    required this.title,
    required this.description,
    required this.status,
    required this.imgDesktop,
    required this.imgMobile,
    this.susep,
    required this.modality,
    required this.drawDate,
    required this.deadlineDate,
    required this.totalTickets,
    required this.minBuyTickets,
    required this.maxBuyTickets,
    required this.ticketValue,
    required this.showDrawDate,
    required this.showAdicionalInfo,
    required this.numbersQuantityButton,
    required this.prizes,
    required this.expirationQrCode,
    required this.url,
    required this.checkAvailableNumbers,
    required this.generalConditions,
    required this.regulation,
    required this.availabilityLabel,
    this.salesCount,
  });

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  static CampaignStatusEnum _parseCampaignStatus(String value) {
    return CampaignStatusEnum.values.firstWhere((e) => e.value == value);
  }

  static CampaignModalityEnum _parseModalityStatus(String value) {
    return CampaignModalityEnum.values.firstWhere((e) => e.value == value);
  }

  factory CampaignModel.fromJson(Map<String, dynamic> json) {

    return CampaignModel(
      title: json['title'],
      description: json['description'],
      status: _parseCampaignStatus(json['status']),
      imgDesktop: json['imgDesktop'],
      imgMobile: json['imgMobile'],
      susep: json['susep'],
      modality: _parseModalityStatus(json['modality']),
      drawDate: DateTime.parse(json['drawDate']),
      deadlineDate: DateTime.parse(json['deadlineDate']),
      totalTickets: json['totalTickets'] ?? 0,
      minBuyTickets: json['minBuyTickets'] ?? 0,
      maxBuyTickets: json['maxBuyTickets'] ?? 0,
      ticketValue: _toDouble(json['ticketValue']),
      showDrawDate: json['showDrawDate'],
      showAdicionalInfo: json['showAdicionalInfo'],
      numbersQuantityButton: List<int>.from(json['numbersQuantityButton']),
      prizes: (json['prizes'] as List)
          .map((e) => CampaignPrizesModel.fromJson(e))
          .toList(),
      expirationQrCode: json['expirationQrCode'] ?? 0,
      url: json['url'],
      checkAvailableNumbers: json['checkAvailableNumbers'],
      generalConditions: json['generalConditions'],
      regulation: json['regulation'],
      availabilityLabel: json['availabilityLabel'] ?? 'teste',
      salesCount: json['salesCount'],
    );
  }
}

class CampaignPrizesModel {
  final String name;
  final String? numberDraw;
  final double value;

  CampaignPrizesModel({
    required this.name,
    this.numberDraw,
    required this.value,
  });

  factory CampaignPrizesModel.fromJson(Map<String, dynamic> json) {
    return CampaignPrizesModel(
      name: json['name'],
      numberDraw: json['numberDraw'],
      value: CampaignModel._toDouble(json['value']),
    );
  }
}
