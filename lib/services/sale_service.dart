import 'package:new_mg_app/config/dio_client.dart';

class SaleService {
  final DioClient _client;

  SaleService(this._client);

  String get apiUrl => '${_client.client.options.baseUrl}/sale';

  Future<dynamic> listByClientAndCampaign(String campaignId) async {
    try {
      final response = await _client.get(
        '$apiUrl/list-by-client-and-campaign/$campaignId',
      );

      return response['data'];
    } catch (e) {
      throw Exception('Erro ao buscar dados: $e');
    }
  }
}
