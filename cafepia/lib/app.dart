import 'package:cafepia/features/authentication/providers/onboarding_provider.dart';
import 'package:cafepia/features/authentication/screens/login/login.dart';
import 'package:cafepia/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:cafepia/main.dart';
import 'package:flutter/material.dart';
import 'package:cafepia/utils/constants/text_strings.dart';
import 'package:cafepia/utils/theme/theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnBoardingProvider())
      ],
      child: MaterialApp(
        title: TTexts.appName,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        // initialBinding: GeneralBindings(),
        home: Scaffold(
          body: Center(
            child: isShow ? OnBoardingScreen() : const LoginScreen(),
          ),
        ),
      ),
    );
  }
}
