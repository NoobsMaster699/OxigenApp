// bottom_navigation.dart

import 'package:coffee_app/common/app_routes.dart';
import 'package:flutter/material.dart';

class SimpleBottomNavigation extends StatefulWidget {
  final int currentIndex;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final BottomNavigationBarType type;
  final Function(int) onTap;

  const SimpleBottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.selectedItemColor,
    required this.unselectedItemColor,
    required this.type,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SimpleBottomNavigation> createState() => _SimpleBottomNavigationState();
}

class _SimpleBottomNavigationState extends State<SimpleBottomNavigation> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      selectedItemColor: widget.selectedItemColor,
      unselectedItemColor: widget.unselectedItemColor,
      type: widget.type,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, Routes.home);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, Routes.menu);
            break;
          // Add cases for additional tabs as needed
          default:
            break;
        }
        if (widget.onTap != null) {
          widget.onTap(index);
        }
      },
      items: _navBarItems,
    );
  }
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_outlined),
    activeIcon: Icon(Icons.shopping_bag),
    label: 'Menu',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
  // Add items for additional tabs as needed
  // ...
];
