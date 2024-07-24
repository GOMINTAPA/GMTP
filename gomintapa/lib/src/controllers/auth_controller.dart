import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../providers/auth_provider.dart';

class AuthController extends GetxController {
  final authProvider = Get.put(AuthProvider());
  final box = GetStorage();

  Future<bool> register(String id, String password, String name) async {
    Map body = await authProvider.register(id, password, name);
    if (body['result'] == 'ok') {
      String token = body['access_token'];
      log("token : $token"); // 'dart:developer' 패키지 내의 log 함수
      // Global.accessToken = token;
      await box.write('access_token', token);
      return true;
    }
    Get.snackbar('회원가입 에러', body['message'],
        snackPosition: SnackPosition.BOTTOM);
    return false;
  }

  Future<bool> login(String id, String password) async {
    Map body = await authProvider.login(id, password);
    if (body['result'] == 'ok') {
      String token = body['access_token'];
      log("token : $token"); // 'dart:developer' 패키지 내의 log 함수
      // Global.accessToken = token;
      await box.write('access_token', token);
      return true;
    }
    Get.snackbar('로그인 에러', body['message'],
        snackPosition: SnackPosition.BOTTOM);
    return false;
  }
}
