import 'package:new_mg_app/config/dio_client.dart';

class UserService {
  final DioClient _client;

  UserService(this._client);

  Future<List<String>> getUsers() async {
    final response = await _client.get('/authenticated');
    return (response as List).map((e) => e['phone'] as String).toList();
  }
}
