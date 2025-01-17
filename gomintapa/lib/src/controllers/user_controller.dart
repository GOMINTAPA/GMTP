import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:gomintapa/src/models/user_model.dart';
import 'package:gomintapa/src/providers/user_provider.dart';

class UserController extends GetxController {
  final provider = Get.put(UserProvider());
  final Rx<UserModel?> my = Rx<UserModel?>(null);

  Future<void> myInfo() async {
    Map body = await provider.show();
    if (body['result'] == 'ok') {
      my.value = UserModel.parse(body['data']);
      return;
    }
    Get.snackbar('회원 에러', body['message'], snackPosition: SnackPosition.BOTTOM);
  }

  Future<bool> updateInfo(String id, String name, String password) async {
    Map body = await provider.update(id, name, password);
    if (body['result'] == 'ok') {
      my.value = UserModel.parse(body['data']);
      return true;
    }
    Get.snackbar('수정 에러', body['message'], snackPosition: SnackPosition.BOTTOM);
    return false;
  }
}
