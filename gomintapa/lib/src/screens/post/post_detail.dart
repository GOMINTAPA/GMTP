import 'package:flutter/material.dart';

import '../../widgets/navigation/back_app_bar.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(),
      body: Container(
        color: Colors.white, // 배경색
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    ProfileSection(),
                    SizedBox(height: 20),
                    Divider(color: Color(0xffD9D9D9)),
                  ],
                ),
                // 프로필 섹션
                // 고민 내용(제목, 내용) 섹션
                // 항목, 사진 섹션
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
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
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
