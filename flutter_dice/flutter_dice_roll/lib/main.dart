import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_dice_roll/gradient_container.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      primaryColor: const Color.fromARGB(255, 54, 94, 50),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(
              Color.fromARGB(255, 54, 94, 50),
            ),
            foregroundColor: WidgetStatePropertyAll<Color>(
              Colors.white,
            ),
            textStyle: WidgetStatePropertyAll<TextStyle>(
              TextStyle(fontSize: 28),
            ),
            padding: WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 32.0,vertical: 10.0),

            )),
      ),
    ),
    home: Scaffold(
      // backgroundColor: const Color.fromARGB(255, 252, 255, 225),
      appBar: AppBar(
        title: const Text('Dice Roll'),
        backgroundColor: const Color.fromARGB(255, 253, 155, 93),
      ),
      body: const GradientContainer.green(),
    ),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Scaffold(
//       // backgroundColor: const Color.fromARGB(255, 252, 255, 225),
//       appBar: AppBar(
//         title: const Text('Demo'),
//         backgroundColor: const Color.fromARGB(255, 255, 200, 82),
//       ),
//       body: GradientContainer(),
//     ),
//     );
//   }
// }


