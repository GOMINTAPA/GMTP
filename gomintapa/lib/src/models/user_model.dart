import 'package:flutter/material.dart';

class UserModel {
  late int id;
  late String name;
  int? profile;
  late AssetImage profileImage; // 프로필 이미지를 저장할 변수

// 기본 프로필 이미지를 설정하는 생성자
  UserModel({
    required this.id,
    required this.name,
    String? profileImagePath, // 프로필 이미지 경로를 선택적으로 받을 수 있게 변경
  }) {
    profileImage =
        AssetImage(profileImagePath ?? 'assets/images/default_profile.png');
  }
}
