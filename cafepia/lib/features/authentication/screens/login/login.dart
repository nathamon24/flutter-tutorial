import 'package:cafepia/common/styles/spaceing_styles.dart';
import 'package:cafepia/utils/constants/colors.dart';
import 'package:cafepia/utils/constants/sizes.dart';
import 'package:cafepia/utils/constants/text_strings.dart';
import 'package:cafepia/utils/device/device_utility.dart';
import 'package:cafepia/utils/helpers/helper_functions.dart';
import 'package:cafepia/utils/http/http_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: THelperFunctions.screenHeight(),
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  TTexts.appName,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 56,
                        color: Theme.of(context).primaryColor,
                        fontFamily: GoogleFonts.aleo().fontFamily,
                      ),
                ),
                //Form
                Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.spaceBtwSections),
                    child: Column(
                      children: [
                        //Email
                        TextFormField(
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.email),
                              labelText: TTexts.email),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        //Password
                        TextFormField(
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.visibility),
                              labelText: TTexts.password),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields / 2,
                        ),
                        //Rememberme and Forget Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Remomber me
                            Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                const Text(TTexts.rememberMe),
                              ],
                            ),
                            //Forget Password
                            TextButton(
                              onPressed: () {},
                              child: const Text(TTexts.forgetPassword),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ), //Sign in Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(TTexts.signIn),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Divider(
                        color: dark ? TColors.darkGrey : TColors.darkGrey,
                        thickness: 0.5,
                        indent: 10,
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      'OR',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: TColors.darkGrey,
                          ),
                    ),
                    Flexible(
                      child: Divider(
                        color: dark ? TColors.darkGrey : TColors.darkGrey,
                        thickness: 0.5,
                        indent: 5,
                        endIndent: 10,
                      ),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // Your onPressed action here
                          },
                          icon: SizedBox(
                            width: 24, // Adjust the width as needed
                            height: 24, // Adjust the height as needed
                            child: Image.asset(
                                'assets/logos/facebook_icon.png'), // Replace with your image path
                          ),
                          label: Text(
                            'Sign In with Facebook',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: TColors.darkerGrey,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset('assets/logos/google_icon.png'),
                          ),
                          label: Text(
                            'Sign In with Google',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: TColors.darkerGrey,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Doesn’t have an account? ',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Sign up.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
