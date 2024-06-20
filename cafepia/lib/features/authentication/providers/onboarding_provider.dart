import 'package:cafepia/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingProvider extends ChangeNotifier {
  PageController pageController = PageController(initialPage: 0);

  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  set currentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  void updatePageIndicator(int index) {
    currentPageIndex = index;
  }

  void dotNavigationClick(int index) {
    currentPageIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  Future<void> nextPage(BuildContext context) async {
    if (_currentPageIndex < 2) {
      // Adjust according to your number of pages
      _currentPageIndex++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // Navigate to login screen or any other screen
      final pref = await SharedPreferences.getInstance();
      await pref.setBool('onBoarding', false);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const LoginScreen(), // Replace with your LoginScreen
        ),
      );
    }
    notifyListeners();
  }

  void skipPage() {
    currentPageIndex = 2; // Go to the last page
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
