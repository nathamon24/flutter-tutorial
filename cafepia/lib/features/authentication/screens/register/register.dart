import 'package:cafepia/features/authentication/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cafepia/common/styles/spaceing_styles.dart';
import 'package:cafepia/common/widgets/appbar/appbar.dart';
import 'package:cafepia/common/widgets/text_field/textFields.dart';
import 'package:cafepia/common/widgets/text_field/textFields_password.dart';
import 'package:cafepia/features/personalization/provider/profile_provider.dart';
import 'package:cafepia/utils/constants/sizes.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key});

  final formController = GlobalKey<FormState>();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Create an account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Form(
            key: formController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TTextFields(
                  controller:
                      Provider.of<RegisterProvider>(context).emailController,
                  label: 'Email',
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TTextFields(
                  controller:
                      Provider.of<RegisterProvider>(context).usernameController,
                  label: 'Username',
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TTextFieldsPassword(
                  controller:
                      Provider.of<RegisterProvider>(context).passwordController,
                  label: 'Password',
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TTextFieldsPassword(
                  controller: confirmPassword,
                  label: 'Confirm Password',
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Provider.of<RegisterProvider>(context)
                        .signUpWithEmailAndPassword(context),
                    child: const Text('Register'),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
