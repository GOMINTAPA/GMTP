import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: 60.0, // AppBar의 높이에 맞추기 위함
            child: Image.asset(
              'assets/images/gomintapa_logo.png',
              fit: BoxFit.contain, // 이미지가 AppBar 안에 맞춰지도록
            ),
          ),
          backgroundColor: Color(0xffD9D9D9),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
              ),
            ),
            SizedBox(width: 10), // 아이콘 사이 여백
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_box_rounded,
                size: 30,
              ),
            ),
            SizedBox(width: 10), // 아이콘 사이 여백
          ],
        ),
      ),
    );
  }
}
