import 'package:new_mg_app/config/dio_client.dart';
import 'package:new_mg_app/models/auth_response_model.dart';
import 'package:new_mg_app/models/client_model.dart';

class ClientService {
  final DioClient _client;

  ClientService(this._client);

  String get apiUrl => '${_client.client.options.baseUrl}/client';

  Future<AuthResponseModel?> authenticateClient(String phone) async {
    try {
      final response = await _client.post(
        '$apiUrl/authenticate',
        data: {'phone': phone},
      );
      return AuthResponseModel.fromJson(response['data']);
    } catch (e) {
      print('erro detalhado: $e');
      throw Exception('Erro na autenticação: $e');
    }
  }

  Future<ClientModel> getClientByAuthenticated() async {
    try {
      final response = await _client.get('$apiUrl/authenticated');
      print(response);
      return ClientModel.fromJson(response['data']);
    } catch (e) {
      throw Exception('Erro na autenticação: $e');
    }
  }
}
