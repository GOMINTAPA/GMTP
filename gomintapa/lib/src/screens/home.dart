import 'package:flutter/material.dart';
import '../widgets/navigation/bottom_navigation_bar.dart';

import '../widgets/navigation/app_bar.dart';

final List<Widget> myTabItems = [
  Center(child: Text('막상막하')),
  Center(child: Text('홈')),
  Center(child: Text('해결탕탕'))
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: IndexedStack(
        index: _selectedIndex,
        children: myTabItems,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
