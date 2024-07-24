import 'package:get/get.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';

class UserController extends GetxController {
  final provider = Get.put(UserProvider());
  final Rx<UserModel?> my = Rx<UserModel?>(null);

  Future<void> myInfo() async {
    Map<String, dynamic> body = await provider.show();
    print("Body: $body"); // Body 로깅
    if (body['result'] == 'ok') {
      my.value = UserModel.parse(body['data']);
      print("Parsed user: ${my.value}"); // 파싱된 사용자 정보 로깅
    } else {
      Get.snackbar('회원에러', body['message'],
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
