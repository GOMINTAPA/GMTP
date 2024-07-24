import 'package:gomintapa/src/providers/provider.dart';

class UserProvider extends Provider {
  
  Future<Map> show() async {
    final response = await get('/api/user/my');
    return response.body;
  }

  Future<Map> update(String id, String name, String password) async {
    final Map<String, String> body = {
      'identifier':id,
      'nick_name':name,
      'password':password,
    };
    final response = await put('/api/user/my', body);
    return response.body;
  }
}