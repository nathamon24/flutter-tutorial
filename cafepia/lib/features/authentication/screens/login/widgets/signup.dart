import 'package:cafepia/features/authentication/screens/register/register.dart';
import 'package:cafepia/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Doesn’t have an account? '),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );
            },
            child: Text(
              'Sign up.',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
