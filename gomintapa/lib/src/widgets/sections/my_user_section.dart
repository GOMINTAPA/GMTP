import 'package:flutter/material.dart';
import 'package:gomintapa/src/models/user_model.dart';

class MyUserSection extends StatelessWidget {
  final UserModel user;
  const MyUserSection(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: user.profileImage),
                const SizedBox(width: 20),
                Text(user.name, style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all(Color(0xFF3C3C3C)),
                  ),
              onPressed: () {},
              child: const Text('정보 수정'),
            )
          ],
        ),
      ),
    );
  }
}
