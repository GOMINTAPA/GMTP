import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  final bool isUserPost; // 사용자가 작성한 글인지 확인하는 변수

  // 생성자
  const ProfileSection({
    Key? key,
    required this.isUserPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양 끝으로 정렬
      children: [
        const Row(
          children: [
            // 프로필 이미지
            Image(
              image:
                  AssetImage('assets/images/default_profile.png'), // 이미지 경로 지정
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
        ),
        if (isUserPost) // 사용자가 작성한 글인 경우에만 표시
          PopupMenuButton<String>(
            onSelected: (String result) {
              switch (result) {
                case 'edit':
                  // 수정 로직
                  print('수정수정'); // 확인용
                  break;
                case 'delete':
                  // 삭제 로직
                  print('삭제삭제'); // 확인용
                  break;
                case 'resolve':
                  // 고민해결로 바꾸는 로직
                  print('고민해결!'); // 확인용
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'edit',
                child: Text('수정'),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text('삭제'),
              ),
              const PopupMenuItem<String>(
                value: 'resolve',
                child: Text('고민해결로 바꾸기'),
              ),
            ],
          ),
      ],
    );
  }
}
