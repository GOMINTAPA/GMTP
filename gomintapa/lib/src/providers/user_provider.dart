import 'dart:convert'; // JSON 디코드를 위해 추가
import 'package:get/get.dart'; // HTTP 클라이언트 라이브러리를 위해 추가
import 'provider.dart';

class UserProvider extends Provider {
  Future<Map<String, dynamic>> show() async {
    try {
      final response = await get('/api/user/my');
      if (response.statusCode == 200) {
        print("Response body: ${response.body}"); // 응답 본문 로깅
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception(
            'Failed to load user data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching user data: $e"); // 에러 로깅
      return {
        'result': 'error',
        'message': e.toString(),
      };
    }
  }
}
