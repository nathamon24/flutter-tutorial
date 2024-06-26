import 'package:flutter/material.dart';
import 'package:cafepia/common/widgets/appbar/appbar_profile.dart';
import 'package:cafepia/features/main/screens/favorite/favorite.dart';
import 'package:cafepia/features/main/screens/search/seaech.dart';
import 'package:cafepia/features/main/screens/setting/setting.dart';
import 'package:cafepia/features/personalization/screens/profile/profile.dart';
import 'package:cafepia/utils/constants/colors.dart';
import 'package:cafepia/features/main/screens/home/home.dart';

class NavigateMenu extends StatefulWidget {
  @override
  _NavigateMenuState createState() => _NavigateMenuState();
}

class _NavigateMenuState extends State<NavigateMenu> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
    SettingScreen(),
  ];

  final List<String> _appBarTitles = <String>[
    'Home',
    'Search',
    'Favorite',
    'Profile',
    'Setting',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? const TAppBarProfile()
          : AppBar(
              title: Text(_appBarTitles[_selectedIndex]),
            ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: TColors.lightGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: TColors.primary,
        unselectedItemColor: TColors.darkGrey,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
