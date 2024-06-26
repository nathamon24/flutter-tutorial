import 'package:flutter/material.dart';

class TBottomNavigateBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  TBottomNavigateBar({
    required this.currentIndex,
    required this.onTap,
  });

  final List<String> _pageRoutes = [
    '/home',
    '/search',
    '/profile',
    '/settings',
    '/more',
  ];

  void _onItemTapped(BuildContext context, int index) {
    Navigator.pushNamed(context, _pageRoutes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => onTap(index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'More',
        ),
      ],
    );
  }
}
