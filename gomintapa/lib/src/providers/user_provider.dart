import 'package:get/get.dart';
import 'provider.dart';

class UserProvider extends Provider {
  Future<Map<String, dynamic>> show() async {
    try {
      final response = await get('/api/user/my');
      print("Request URL: /api/user/my");
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        return response.body as Map<String, dynamic>;
      } else {
        throw Exception(
            'Failed to load user data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return {
        'result': 'error',
        'message': e.toString(),
      };
    }
  }
}
