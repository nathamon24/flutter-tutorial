import 'package:cafepia/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      TTexts.appName,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontSize: 56,
          color: Theme.of(context).primaryColor,
          fontFamily: GoogleFonts.aleo().fontFamily),
    );
  }
}
