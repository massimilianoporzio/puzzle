import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';
import 'package:puzzle/src/features/dark_mode/presentation/cubit/dark_mode_cubit.dart';
import 'package:puzzle/src/features/game/presentation/cubit/sound/sound_cubit.dart';

import 'package:puzzle/src/features/game/presentation/widgets/puzzle_area.dart';

import '../cubit/game/game_cubit.dart';

class GamePage extends StatelessWidget with UiLoggy {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeMode = context.watch<DarkModeCubit>().state.mode;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 4, 39, 68),
        appBar: AppBar(
          centerTitle: false,
          title: Image.asset(
            'assets/dumuraLogo.png',
            fit: BoxFit.contain,
            height: 50,
          ),
          actions: [
            IconButton(
                color: Colors.white,
                tooltip: "Light / Dark mode",
                onPressed: () {
                  loggy.debug("TOGGLE THEME MODE");
                  context.read<DarkModeCubit>().toggleDarkMode();
                },
                icon: Icon(themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode)),
            IconButton(
                color: Colors.white,
                tooltip: "Mute / Unmute",
                onPressed: () {
                  context.read<SoundCubit>().toggleMute();
                },
                icon: BlocBuilder<SoundCubit, SoundState>(
                  builder: (context, state) {
                    return Icon(
                        state.muted ? Icons.volume_off : Icons.volume_mute);
                  },
                )),
            IconButton(
              color: Colors.white,
              tooltip: "Reset game",
              onPressed: () {
                context.read<GameCubit>().resetPuzzle();
              },
              icon: const Icon(Icons.restart_alt),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              color: Color.fromARGB(255, 4, 39, 68),
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
