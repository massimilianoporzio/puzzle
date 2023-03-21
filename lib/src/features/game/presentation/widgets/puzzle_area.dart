import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:puzzle/src/features/game/presentation/widgets/puzzle_title.dart';

import '../cubit/game/game_cubit.dart';
import '../cubit/sound/sound_cubit.dart';

class PuzzleArea extends StatefulWidget {
  const PuzzleArea({super.key});

  @override
  State<PuzzleArea> createState() => _PuzzleAreaState();
}

class _PuzzleAreaState extends State<PuzzleArea> {
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    // print("MEDIAQUERY SIZE: ${MediaQuery.of(context).size}");
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black12,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          //CREO L'IMMAGINE DEL ROMBO
          //recupero lo stato e resto a guardarne i cambiamenti

          return BlocListener<SoundCubit, SoundState>(
            listener: (context, state) {},
            child: BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                // print("Bloc Builder");

                // print("Constraints: $constraints");
                final tileWidth = constraints.maxWidth / state.cols;
                final tileHeight = constraints.maxHeight / state.rows;
                return Stack(
                  children: [
                    ...state.puzzle.tiles.asMap().entries.map((e) => PuzzleTile(
                          index: e.key,
                          width: tileWidth,
                          height: tileHeight,
                          tile: e.value,
                          onTap: () {
                            context.read<GameCubit>().onTileTapped(e.value);
                          },
                        ))
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
