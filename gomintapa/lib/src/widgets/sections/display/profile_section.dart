import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // 프로필 이미지
        Image(
          image: AssetImage('assets/images/default_profile.png'), // 이미지 경로 지정
          width: 48, // 너비
          height: 48, // 높이
          fit: BoxFit.cover, // 이미지 맞춤 형태
          alignment: Alignment.center, // 이미지 가운데 정렬
        ),
        SizedBox(width: 20), // 이미지와 닉네임 사이 간격
        // 사용자 이름
        Text(
          'username', // 실제 사용자 이름으로 대체
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
