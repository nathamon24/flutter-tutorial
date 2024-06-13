import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  // final radomizer = Random();
  var curretDiceRoll = 1;
  // var activeDiceImage = 'assets/images/dice-1.png';

  void rollDice() {
    // var diceRoll = Random().nextInt(6) + 1;

    setState(() {
      curretDiceRoll = randomizer.nextInt(6) + 1;
      // activeDiceImage = 'assets/images/dice-$curretDiceRoll.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$curretDiceRoll.png',
          // width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          // onPressed: () {
          //...
          //},
          onPressed: rollDice,
          label: const Text('Roll Dice'),
        )
      ],
    );
  }
}
