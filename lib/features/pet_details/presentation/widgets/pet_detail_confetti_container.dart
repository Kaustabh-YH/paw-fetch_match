import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class PetDetailConfettiContainer extends StatelessWidget {
  final ConfettiController confettiController;

  const PetDetailConfettiContainer({
    super.key,
    required this.confettiController,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        numberOfParticles: 100,
        confettiController: confettiController,
        blastDirectionality: BlastDirectionality.explosive,
        colors: const [
          Colors.black,
          Colors.blue,
          Colors.purple,
          Colors.red,
          Colors.yellow,
          Colors.green,
          Colors.orange,
          Colors.indigoAccent
        ],
      ),
    );
  }
}
