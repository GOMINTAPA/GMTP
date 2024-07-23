import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/auth_provider.dart';
import '../screens/shared/global.dart';

class AuthController extends GetxController {
  final RxBool isButtonEnabled = false.obs;
  final authProvider = Get.put(AuthProvider());
  final RxBool showVerifyForm = false.obs;
  final RxString buttonText = "인증문자 받기".obs;
  // String? id;
  Timer? countdownTimer;

  Future<bool> register(String id, String password, String name) async {
    Map body = 
      await authProvider.register(id, password, name);
    if (body['result'] == 'ok') {
      String token = body['access_token'];
      log("token : $token"); // 'dart:developer' 패키지 내의 log 함수
      Global.accessToken = token;
      return true;
    }
    Get.snackbar('회원가입 에러', body['message'],
    snackPosition: SnackPosition.BOTTOM);
    return false;
}

  void _startCountdown(DateTime expiryTime) {
    isButtonEnabled.value = false;
    showVerifyForm.value = true;
    countdownTimer?.cancel();

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      Duration timeDiff = expiryTime.difference(DateTime.now());

      if (timeDiff.isNegative) {
        buttonText.value = "인증문자 다시 받기";
        isButtonEnabled.value = true;
        timer.cancel();
      } else {
        String minutes = timeDiff.inMinutes.toString().padLeft(2,'0');
        String seconds = (timeDiff.inSeconds%60).toString().padLeft(2,'0');
        buttonText.value = "인증문자 다시 받기 $minutes:$seconds";
      }
    });
  }

  Future<bool> login(String id, String password) async {
    Map body = await authProvider.login(id, password);
    if (body['result'] == 'ok') {
      String token = body['access_token'];
      log("token : $token"); // 'dart:developer' 패키지 내의 log 함수
      Global.accessToken = token;
      return true;
    }
    Get.snackbar('로그인 에러', body['message'],
    snackPosition: SnackPosition.BOTTOM);
    return false;
  }

}