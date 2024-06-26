import 'package:cafepia/navigate_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cafepia/common/widgets/text_field/textFields_password.dart';
import 'package:cafepia/utils/constants/sizes.dart';
import 'package:cafepia/utils/constants/text_strings.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rememberMe = ValueNotifier<bool>(false);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rememberMe.dispose();
    super.dispose();
  }

  void _clearFields() {
    emailController.clear();
    passwordController.clear();
    rememberMe.value = false;
  }

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        print('User signed in: ${userCredential.user!.email}');

     
        _clearFields();

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NavigateMenu()));
      }
    } catch (e) {
      // Handle sign-in errors here
      print('Failed to sign in: $e');
      // Optionally, show an error dialog or message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign in: $e'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.email),
              labelText: TTexts.email,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TTextFieldsPassword(
            controller: passwordController,
            placeholder: TTexts.password,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: rememberMe,
                    builder: (context, value, child) {
                      return Checkbox(
                        value: value,
                        onChanged: (newValue) {
                          rememberMe.value = newValue!;
                        },
                      );
                    },
                  ),
                  const Text(TTexts.rememberMe),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Implement forgot password functionality here
                  // Example: Navigator.pushNamed(context, '/forgot_password');
                },
                child: const Text(TTexts.forgetPassword),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _signInWithEmailAndPassword(context),
              child: const Text(TTexts.signIn),
            ),
          ),
        ],
      ),
    );
  }
}
