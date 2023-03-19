import 'package:flutter/material.dart';
import 'package:puzzle/src/features/game/presentation/widgets/puzzle_area.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dumura"),
      ),
      body: SafeArea(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              padding: const EdgeInsets.all(20.0),
              child: const AspectRatio(
                aspectRatio: 1 / 1,
                child: PuzzleArea(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
