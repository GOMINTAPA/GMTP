import 'package:gomintapa/src/providers/provider.dart';

class AuthProvider extends Provider {

  Future<Map> requestPhoneCode(String phone) async {
    final response = await post('/auth/phone', {'phone': phone});
    return response.body;
  }

  Future<Map> verifyPhoneNumber(String code) async {
    final response = await put('/auth/phone', {'code': code});
    return response.body;
  }
  Future<Map> register(String id, String password, String name,[int? profile]) async {
    final response = await post('/auth/register', {
    'identifier': id,
    'password': password,
    'name': name,
    'profile': profile,
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