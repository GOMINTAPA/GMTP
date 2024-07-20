import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/forms/label_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              '로그인',
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
              // 로그인과 아이디 사이 구분선
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
              hintText: '아이디를 입력해주세요.',
              keyboardType: TextInputType.phone,
              //controller: _idController,
            ),
            LabelTextField(
              label: '비밀번호',
              hintText: '비밀번호를 입력해주세요.',
              //controller: _passwordController,
              isObscure: true,
            ),
            const SizedBox(height: 108),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3C3C3C),
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text('로그인'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF3C3C3C),
              ),
              onPressed: () {},
              child: const Text('회원가입'),
            )
          ],
        ),
      ),
    );
  }
}
