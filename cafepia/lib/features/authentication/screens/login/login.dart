import 'package:cafepia/common/styles/spaceing_styles.dart';
import 'package:flutter/material.dart';
import 'package:cafepia/features/authentication/screens/login/widgets/divider.dart';
import 'package:cafepia/features/authentication/screens/login/widgets/login_form.dart';
import 'package:cafepia/features/authentication/screens/login/widgets/logo.dart';
import 'package:cafepia/features/authentication/screens/login/widgets/signup.dart';
import 'package:cafepia/features/authentication/screens/login/widgets/social_signin_group.dart';
import 'package:cafepia/utils/constants/colors.dart';
import 'package:cafepia/utils/constants/sizes.dart';
import 'package:cafepia/utils/constants/text_strings.dart';
import 'package:cafepia/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool dark = false; // Replace with your logic to determine dark mode

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppLogo(),
              const SizedBox(height: TSizes.spaceBtwSections),
              LoginForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              OrDivider(dark: dark),
              const SizedBox(height: TSizes.spaceBtwSections),
              SocialSignInButtons(),
              const SizedBox(height: TSizes.spaceBtwSections),
              SignUpLink(),
            ],
          ),
        ),
      ),
    );
  }
}
