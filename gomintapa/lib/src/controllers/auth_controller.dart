import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomintapa/src/screens/my/mypage.dart';

import '../providers/auth_provider.dart';
import '../screens/shared/global.dart';

class AuthController extends GetxController {
  final RxBool isButtonEnabled = false.obs;
  final authProvider = Get.put(AuthProvider());
  final RxBool showVerifyForm = false.obs;
  final RxString buttonText = "인증문자 받기".obs;

  final RxString _id = ''.obs; // 사용자 아이디
  final RxString _name = ''.obs; // 사용자 닉네임

  // String? id;
  Timer? countdownTimer;

  String get id => _id.value;
  String get name => _name.value;

  Future<bool> register(String id, String password, String name) async {
    Map body = await authProvider.register(id, password, name);
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
        String minutes = timeDiff.inMinutes.toString().padLeft(2, '0');
        String seconds = (timeDiff.inSeconds % 60).toString().padLeft(2, '0');
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

  // 기존 사용자 정보 가져오기
  Future<void> loadUserProfile() async {
    Map body = await authProvider.getUserProfile();
    if (body['result'] == 'ok') {
      _id.value = body['user']['identifier'];
      _name.value = body['user']['nick_name'];
    } else {
      Get.snackbar('정보 로드 에러', body['message'],
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // 사용자 프로필 업데이트 메서드
  Future<bool> updateProfile(String id, String password, String name) async {
    Map updatedData = {};

    // 기존 값과 비교하여 변경된 데이터만 추가
    if (id != _id.value) updatedData['identifier'] = id;
    if (name != _name.value) updatedData['nick_name'] = name;
    if (password.isNotEmpty) updatedData['password'] = password;

    if (updatedData.isEmpty) {
      // 변경된 데이터가 없을 경우
      Get.snackbar('변경 없음', '변경된 정보가 없습니다.');
      return true;
    }

    Map body = await authProvider.updateProfile(updatedData);
    if (body['result'] == 'ok') {
      Get.snackbar('프로필 업데이트', '프로필이 성공적으로 업데이트되었습니다.',
          snackPosition: SnackPosition.BOTTOM);
      Get.off(() => const MyPage());
      return true;
    }
    Get.snackbar('프로필 업데이트 에러', body['message'],
        snackPosition: SnackPosition.BOTTOM);
    return false;
  }
}
