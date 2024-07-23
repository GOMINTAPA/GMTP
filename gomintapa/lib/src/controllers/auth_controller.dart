import 'dart:async';
import 'dart:developer';

import 'package:gomintapa/src/providers/auth_provider.dart';
import 'package:gomintapa/src/screens/shared/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool isButtonEnabled = false.obs;
  final authProvider = Get.put(AuthProvider());
  final RxBool showVerifyForm = false.obs;
  final RxString buttonText = "인증문자 받기".obs;
  String? id;
  Timer? countdownTimer;

  Future<bool> register(String password, String name, int? profile) async {
    Map body = 
      await authProvider.register(id!, password, name, profile);
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

  void updateButtonState(TextEditingController phoneController) {
    String text = phoneController.text.replaceAll('-', '');

    if (text.length <= 3 && !text.startsWith('010')) {
      text = '010';
    } else if (!text.startsWith('010')) {
      text = '010$text';
    }
    if (text.length > 11) {
      text = text.substring(0,11);
    }

    String formattedText = _formatPhoneNumber(text);
    int cursorPosition = phoneController.selection.baseOffset +
    (formattedText.length - phoneController.text.length);

    phoneController.value = TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: cursorPosition.clamp(0, formattedText.length)),
    );
    isButtonEnabled.value = text.length == 11;
  }

  String _formatPhoneNumber(String text) {
    if (text.length > 7) {
      return '${text.substring(0,3)}-${text.substring(3,7)}-${text.substring(7)}';
    
    } else if (text.length>3) {
      return '${text.substring(0,3)}-${text.substring(3)}';
    }
    return text;
  }

}