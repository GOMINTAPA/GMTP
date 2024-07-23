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
                    // 프로필 섹션
                    ProfileSection(),
                    SizedBox(height: 10),
                    Divider(color: Color(0xffD9D9D9)),
                    // 고민 내용(제목, 내용) 섹션
                    ContentSection(
                      title: '안녕하세요ㅎㅎ',
                      content:
                          '아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 아로인 바보 ',
                    ),
                    Divider(color: Color(0xffD9D9D9)),
                    // 항목, 사진 섹션
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ContentSection extends StatelessWidget {
  final String title;
  final String content;

  const ContentSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
