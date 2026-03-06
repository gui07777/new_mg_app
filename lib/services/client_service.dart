// ignore_for_file: avoid_print

import 'package:new_mg_app/components/login_modal_component.dart';
import 'package:new_mg_app/config/dio_client.dart';

class ClientService {
  final DioClient _client;

  ClientService(this._client);

  Future<AuthResponse?> authenticateClient(String phone) async {
    try {
      final response = await _client.post(
        '/authenticate',
        data: {'phone': phone},
      );
      if (response.data != null) {
        return AuthResponse.fromJson(response.data);
      }
    } catch (e) {
      print("Erro de autenticação: $e");
      return null;
    }
  }

  Future<dynamic> getClientByAuthenticated() async {
    try {
      final response = await _client.get('/authenticated');
      return response.data;
    } catch (e) {
      print('Erro na autenticação $e');
      return null;
    }
  }
}
