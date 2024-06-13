import 'package:flutter/material.dart';
import 'package:flutter_dice_roll/dice_roller.dart';
// import 'package:flutter_dice_roll/style_text.dart';

//start with lower
//final daata container will not receive new value
const startAlignment = Alignment.topCenter;

class GradientContainer extends StatelessWidget {
  //super refers to the parent class -> Stateless
  const GradientContainer(this.startColor, this.endColor, {super.key});

  const GradientContainer.green({super.key})
      : startColor = const Color.fromARGB(255, 231, 211, 127),
        endColor = const Color.fromARGB(255, 255, 240, 178);

  final Color startColor;
  final Color endColor;
 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: startAlignment,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
          child: DiceRoller()),
    );
  }
}

// class GradientContainer extends StatelessWidget {
//   //super refers to the parent class -. Stateless
//   const GradientContainer( {super.key,required this.colors});
//   final List<Color> colors;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: colors,
//           begin: startAlignment,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: const Center(
//         child: StyledText('hello!!!'),
//       ),
//     );
//   }
// }
