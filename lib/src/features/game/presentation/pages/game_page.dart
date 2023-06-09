import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/src/features/game/presentation/cubit/sound/sound_cubit.dart';

import 'package:puzzle/src/features/game/presentation/widgets/puzzle_area.dart';

import '../cubit/game/game_cubit.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dumura"),
        actions: [
          IconButton(onPressed: () {
            context.read<SoundCubit>().toggleMute();
          }, icon: BlocBuilder<SoundCubit, SoundState>(
            builder: (context, state) {
              return Icon(state.muted ? Icons.volume_off : Icons.volume_mute);
            },
          )),
          IconButton(
            onPressed: () {
              context.read<GameCubit>().resetPuzzle();
            },
            icon: const Icon(Icons.restart_alt),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              child: const PuzzleArea(),
            )
          ],
        ),
      ),
    );
  }
}
