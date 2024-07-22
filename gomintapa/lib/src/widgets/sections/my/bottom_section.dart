import 'package:flutter/material.dart';
import 'package:gomintapa/src/widgets/buttons/logout.button.dart';

class BottomSection extends StatelessWidget {
  final VoidCallback onLogoutPressed;

  const BottomSection({Key? key, required this.onLogoutPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 360,
        height: 60,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(right: 10), // 컨테이너 내부 여백 추가
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LogoutButton(
                onPressed: onLogoutPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
