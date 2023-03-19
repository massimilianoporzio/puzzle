import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/src/features/game/presentation/cubit/game_cubit.dart';
import 'package:puzzle/src/features/game/presentation/widgets/puzzle_title.dart';

class PuzzleArea extends StatelessWidget {
  const PuzzleArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          //recupero lo stato e resto a guardarne i cambiamenti
          final state = context.watch<GameCubit>().state;
          final tileWidth = constraints.maxWidth / state.cols;
          final tileHeight = constraints.maxHeight / state.rows;
          return Stack(
            children: [
              ...state.puzzle.tiles
                  .map((tile) => PuzzleTile(
                        height: tileHeight,
                        width: tileWidth,
                      ))
                  .toList()
            ],
          );
        },
      ),
    );
  }
}
