import 'package:flutter/material.dart';

class UserModel {
  late int id;
  late String name;
  int? profile;
  AssetImage profileImage = AssetImage('assets/images/default_profile.png');

// 기본 프로필 이미지를 설정하는 생성자
  UserModel({
    required this.id,
    required this.name,

  });

  UserModel.parse(Map m) {
    id = m['id'];
    name = m['nick_name'];
    profile = m['profile_id'];
    profileImage = AssetImage(
      m['profile_image_path'] ?? 'assets/images/default_profile.png',
    );
  }
}
