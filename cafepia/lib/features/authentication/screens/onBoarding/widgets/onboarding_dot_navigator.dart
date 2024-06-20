import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cafepia/utils/constants/colors.dart';
import 'package:cafepia/utils/device/device_utility.dart';
import 'package:provider/provider.dart';
import 'package:cafepia/features/authentication/providers/onboarding_provider.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: TDeviceUtils.getBottomNavigationBarHeight()), // Adjust as needed
        child: Consumer<OnBoardingProvider>(
          builder: (context, provider, _) => SmoothPageIndicator(
            controller: provider.pageController,
            onDotClicked: (index) {
              provider.dotNavigationClick(index);
            },
            count: 3, // Adjust based on the number of pages
            effect: const ScrollingDotsEffect(
              activeDotColor: TColors.secondary,
              dotHeight: 12,
              dotWidth: 12,
            ),
          ),
        ),
      ),
    );
  }
}
