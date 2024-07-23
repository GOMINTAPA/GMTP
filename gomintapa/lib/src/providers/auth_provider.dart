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

  Future<Map> getUserProfile() async {
    final response = await get('/auth/profile'); // 사용자 프로필 API 호출
    return response.body;
  }

  // 사용자 프로필 업데이트
  Future<Map> updateProfile(Map updatedData) async {
    final response = await put('/auth/profile', updatedData);
    return response.body;
  }
}
