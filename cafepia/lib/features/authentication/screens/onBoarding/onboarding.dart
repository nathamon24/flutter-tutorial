import 'package:cafepia/features/authentication/providers/onboarding_provider.dart';
import 'package:cafepia/features/authentication/screens/onBoarding/widgets/onboarding_dot_navigator.dart';
import 'package:cafepia/features/authentication/screens/onBoarding/widgets/onboarding_page.dart';
import 'package:cafepia/features/authentication/screens/onBoarding/widgets/onboarding_skip.dart';
import 'package:cafepia/utils/constants/colors.dart';
import 'package:cafepia/utils/constants/image_strings.dart';
import 'package:cafepia/utils/constants/sizes.dart';
import 'package:cafepia/utils/constants/text_strings.dart';
import 'package:cafepia/utils/device/device_utility.dart';
import 'package:cafepia/utils/helpers/helper_functions.dart';
import 'package:cafepia/utils/http/http_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBoardingProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: provider.pageController,
            onPageChanged: (index) {
              provider.updatePageIndicator(index);
            },
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
                pageIndex: 1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
                pageIndex: 2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
                pageIndex: 3,
              )
            ],
          ),
          const OnBoardingSkip(),
          OnboardingDotNavigation(),
        ],
      ),
    );
  }
}
