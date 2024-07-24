import 'package:flutter/material.dart';

class ProfileSection extends StatefulWidget {
  final bool isUserPost; // 사용자 게시물 여부를 판단하는 변수

  const ProfileSection({super.key, required this.isUserPost});

  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  bool isResolved = false; // 고민 해결 상태를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 프로필 이미지
        const Image(
          image: AssetImage('assets/images/default_profile.png'), // 이미지 경로 지정
          width: 48, // 너비
          height: 48, // 높이
          fit: BoxFit.cover, // 이미지 맞춤 형태
          alignment: Alignment.center, // 이미지 가운데 정렬
        ),
        const SizedBox(width: 20), // 이미지와 닉네임 사이 간격
        // 사용자 이름
        const Text(
          'username', // 실제 사용자 이름으로 대체
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(), // 남은 공간을 차지하여 우측 정렬
        if (isResolved)
          Container(
            child: Image(
              image: AssetImage('assets/images/tangtang_selected.png'),
              width: 40, // 이미지 크기 조정
              height: 40,
            ),
          ),
        if (widget.isUserPost)
          PopupMenuButton<String>(
            color: Colors.white, // 배경색 흰색으로 설정
            onSelected: (value) {
              // 선택된 값에 따라 동작 수행
              switch (value) {
                case 'edit':
                  // 수정 동작
                  break;
                case 'delete':
                  // 삭제 동작
                  break;
                case 'toggle':
                  // 고민해결 상태를 토글할 때의 동작
                  setState(() {
                    isResolved = !isResolved;
                  });
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'edit',
                  child: Text('수정'),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('삭제'),
                ),
                PopupMenuItem<String>(
                  value: 'toggle',
                  child: Row(
                    children: [
                      isResolved ? Text('고민해결 완') : Text('고민해결 전'),
                      Spacer(),
                      isResolved
                          ? Icon(Icons.check, color: Colors.green)
                          : Icon(Icons.clear, color: Colors.red),
                    ],
                  ),
                ),
              ];
            },
          ),
      ],
    );
  }
}
