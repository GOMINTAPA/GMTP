import 'package:flutter/material.dart';

class ConcernTabBarView extends StatelessWidget {
  final TabController controller;

  const ConcernTabBarView({required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        ListView(
          padding: const EdgeInsets.all(30),
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "작성한 고민",
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
          ],
        ),
        ListView(
          padding: const EdgeInsets.all(30),
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "참견한 고민",
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
