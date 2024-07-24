import 'package:gomintapa/src/providers/provider.dart';

class AuthProvider extends Provider {

  Future<Map> register(String id, String password, String name) async {
    final response = await post('/auth/register', {
    'identifier': id,
    'password': password,
    'nick_name': name,
    // 'profile': profile,
    });
    return response.body;
  }

  Future<Map> login(String id, String password) async {
    final response = await post('/auth/login', {
      'identifier': id,
      'password': password,
    });
    return response.body;
  }

}