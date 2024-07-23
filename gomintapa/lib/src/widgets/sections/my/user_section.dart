import 'package:flutter/material.dart';
import 'package:gomintapa/src/models/user_model.dart';
import 'package:gomintapa/src/widgets/buttons/edit_profile_button.dart';

class UserSection extends StatelessWidget {
  final UserModel user;
  const UserSection(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 계정 정보 영역
            Container(
              width: 280,
              height: 90,
              alignment: Alignment.center, // 컨테이너 내의 내용 중앙 정렬
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 계정 정보 : 이미지 영역
                  Container(
                    width: 90,
                    height: 90,
                    alignment: Alignment.center, // 이미지 중앙 정렬
                    child: Container(
                      width: 68,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: user.profileImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // 계정 정보 : 닉네임 영역
                  Container(
                      width: 190,
                      height: 90,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          user.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.50,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 8),
            // 계정 정보 : 버튼 영역
            EditProfileButton(
              onPressed: () {
                // 정보 수정 버튼을 눌렀을 때 실행할 코드
              },
            ),
          ],
        ),
      ),
    );
  }
}
