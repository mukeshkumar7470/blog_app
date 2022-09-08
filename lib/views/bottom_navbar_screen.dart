import 'package:flutter/material.dart';

import 'artical_screen.dart';
import 'dashboard_screen.dart';
import 'widgets/bottom_nav_item.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  List screen = [
    const DashboardScreen(),
    const ArticlesScreen(),
    const ArticlesScreen(),
    const DashboardScreen(),
  ];
  int current = 0;
  final String _iconPath = 'assets/images';

  String tabMenuIcon(String iconName, int number) {
    if (current == number) {
      return '$_iconPath/${iconName}_active.png';
    }
    return '$_iconPath/$iconName.png';
  }

  bool isMenuActive(int number) {
    return current == number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: screen[current],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 82,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(color: Colors.grey.shade200, width: 0.1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomNavItem(
                icon: tabMenuIcon('home', 0),
                text: 'Home',
                isActive: isMenuActive(0),
                onTap: () {
                  setState(() {
                    current = 0;
                  });
                },
              ),
              BottomNavItem(
                icon: tabMenuIcon('articles', 1),
                text: 'Articles',
                isActive: isMenuActive(1),
                onTap: () {
                  setState(() {
                    current = 1;
                  });
                },
              ),
              BottomNavItem(
                icon: tabMenuIcon('search', 2),
                text: 'Search',
                isActive: isMenuActive(2),
                onTap: () {
                  setState(() {
                    current = 2;
                  });
                },
              ),
              BottomNavItem(
                icon: tabMenuIcon('menu', 3),
                text: 'Menu',
                isActive: isMenuActive(3),
                onTap: () {
                  setState(() {
                    current = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
