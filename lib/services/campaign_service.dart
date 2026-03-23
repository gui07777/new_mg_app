import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:new_mg_app/config/dio_client.dart';
import 'package:new_mg_app/models/campaign_model.dart';

class CampaignService {
  final DioClient _client;
  CampaignService(this._client);
  String get apiUrl => '${_client.client.options.baseUrl}/campaign';

  Future<List<CampaignModel>> list() async {
    try {
      final credentials = base64Encode(utf8.encode('code:P@ssw0rd'));
      final response = await _client.get(
        apiUrl,
        options: Options(headers: {'Authorization': 'Basic $credentials'}),
      );
      return (response['data'] as List)
          .map((e) => CampaignModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Erro ao buscar campanhas: $e');
    }
  }
}
