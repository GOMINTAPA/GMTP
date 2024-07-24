import 'package:get/get.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';

class UserController extends GetxController {
  final provider = Get.put(UserProvider());
  final Rx<UserModel?> my = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    myInfo(); // 페이지가 초기화될 때 사용자 정보를 로드합니다.
  }

  Future<void> myInfo() async {
    try {
      Map<String, dynamic> body = await provider.show();
      print("Body: $body"); // 응답 로그
      if (body['result'] == 'ok') {
        my.value = UserModel.parse(body['data']);
        print("Parsed user: ${my.value}"); // 파싱된 사용자 정보 로그
      } else {
        Get.snackbar('회원에러', body['message'],
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error fetching user data: $e");
      Get.snackbar('회원에러', '데이터를 로드하는 중 오류가 발생했습니다.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
