import 'package:new_mg_app/models/client_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*constante pra criar um StateNotifierProvider que usa a classe AuthNotifier para gerenciar um estado do tipo ClientModel*/

final authProvider = StateNotifierProvider<AuthNotifier, ClientModel?>((ref) {
  return AuthNotifier();
});

//o AuthNotifier controla o estado, e o estado é um ClientModel

class AuthNotifier extends StateNotifier<ClientModel?> {
  AuthNotifier() : super(null); // estado inicial (state = null)

  //atualiza o estado (usuário logado)
  void setUser(ClientModel client) {
    state = client;
  }

  //remove o usuário (usuário deslogado)
  void logout() {
    state = null;
  }

  //outra forma de checar login
  bool get isAuthenticated => state != null;
}
