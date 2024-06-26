import 'package:cafepia/features/authentication/screens/login/widgets/social_signin.dart';
import 'package:cafepia/features/personalization/provider/profile_provider.dart';
import 'package:cafepia/navigate_menu.dart';
import 'package:cafepia/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocialSignInButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialSignInButton(
          onPressed: () async {
            await Provider.of<ProfileProvider>(context, listen: false)
                .loginWithFacebook();
            if (Provider.of<ProfileProvider>(context, listen: false).profile !=
                null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => NavigateMenu()),
              );
            }
          },
          iconPath: 'assets/logos/facebook_icon.png',
          buttonText: 'Sign In with Facebook',
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        SocialSignInButton(
          onPressed: () {},
          iconPath: 'assets/logos/google_icon.png',
          buttonText: 'Sign In with Google',
        ),
      ],
    );
  }
}
