import 'package:cafepia/features/authentication/providers/onboarding_provider.dart';
import 'package:cafepia/utils/constants/sizes.dart';
import 'package:cafepia/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.pageIndex,
  });
  final String image, title, subtitle;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBoardingProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: THelperFunctions.screenWidth() * 0.8,
            height: THelperFunctions.screenHeight() * 0.4,
            child: Image.asset(
              image,
              fit: BoxFit.contain, // Adjust the fit based on your requirement
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
          if (pageIndex < 3)
            const SizedBox(
              height: TSizes.buttonHeight,
            )
          else
            ElevatedButton(
              onPressed: () {
                provider.nextPage(context);
              },
              child: Container(
                width: double.infinity, // Full width button
                height: TSizes.buttonHeight, // Adjust height as needed
                alignment: Alignment.center,
                child: Text(
                  'Let’s Start !',
                ),
              ),
            ),
        ],
      ),
    );
  }
}
