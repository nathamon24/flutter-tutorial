import 'package:cafepia/utils/constants/colors.dart';
import 'package:cafepia/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final bool dark;

  const OrDivider({Key? key, required this.dark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const SizedBox(width: 10), // Adjust spacing here as needed
        Text(
          'OR',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: TColors.darkGrey,
              ),
        ),
        const SizedBox(width: 10), // Adjust spacing here as needed
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.darkGrey,
            thickness: 0.5,
            indent: 5,
            endIndent: 10,
          ),
        )
      ],
    );
  }
}
