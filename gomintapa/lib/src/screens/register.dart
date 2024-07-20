import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/forms/label_textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //final authController = Get.put(AuthController());
  //final _idController = TextEditingController();
  //final _passwordController = TextEditingController();
  //final _passwordConfirmController = TextEditingController();
  //final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 7),
        child: ListView(
          children: [
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.only(left: 156), // 이미지 왼쪽에 156픽셀 패딩 추가
              child: Image.asset(
                'assets/images/gmtp_logo_big.png',
                width: 130,
                height: 130,
              ),
            ),
            const SizedBox(height: 47),
            Text(
              '회원가입',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.50,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              // 회원가입과 아이디 사이 구분선
              width: 320,
              height: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF9A9A9A),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            LabelTextField(
              label: '아이디',
              hintText: '4~12자리의 숫자, 영문만 가능합니다.',
              keyboardType: TextInputType.phone,
              //controller: _idController,
            ),
            LabelTextField(
              label: '닉네임',
              hintText: '닉네임을 입력해주세요.',
              keyboardType: TextInputType.phone,
              //controller: _nameController,
            ),
            LabelTextField(
              label: '비밀번호',
              hintText: '4~12자리의 숫자, 영문만 가능합니다.',
              //controller: _passwordController,
              isObscure: true,
            ),
            LabelTextField(
              label: '비밀번호 확인',
              hintText: '비밀번호를 한번 더 입력해주세요.',
              //controller: _passwordConfirmController,
              isObscure: true,
            ),
            const SizedBox(height: 108),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3C3C3C),
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text('가입하기'),
            ),
          ],
        ),
      ),
    );
  }
}
