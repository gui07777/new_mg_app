import 'package:new_mg_app/models/client_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, ClientModel?>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<ClientModel?> {
  AuthNotifier() : super(null);
  void setUser(ClientModel client) {
    state = client;
  }

  void logout() {
    state = null;
  }

  bool get isAuthenticated => state != null;
}
