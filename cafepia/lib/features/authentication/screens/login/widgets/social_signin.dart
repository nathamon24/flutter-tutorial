import 'package:cafepia/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SocialSignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final String buttonText;

  const SocialSignInButton({
    required this.onPressed,
    required this.iconPath,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: SizedBox(
          width: 24,
          height: 24,
          child: Image.asset(iconPath),
        ),
        label: Text(
          buttonText,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: TColors.darkerGrey,
              ),
        ),
      ),
    );
  }
}
