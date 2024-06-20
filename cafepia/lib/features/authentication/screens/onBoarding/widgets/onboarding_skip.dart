import 'package:cafepia/features/authentication/providers/onboarding_provider.dart';
import 'package:cafepia/utils/constants/sizes.dart';
import 'package:cafepia/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        final provider = Provider.of<OnBoardingProvider>(context);
    return Positioned(
        right: 0,
        top: TDeviceUtils.getAppBarHeight(),
        child: TextButton(
          onPressed: () {provider.skipPage();},
          child: Text(
            'Skip',
            // style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).disabledColor),
          ),
        ));
  }
}
