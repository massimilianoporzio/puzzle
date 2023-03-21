import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/src/features/game/presentation/cubit/game_cubit.dart';
import 'package:puzzle/src/features/game/presentation/widgets/puzzle_title.dart';

class PuzzleArea extends StatelessWidget {
  const PuzzleArea({super.key});

  @override
  Widget build(BuildContext context) {
    print("MEDIAQUERY SIZE: ${MediaQuery.of(context).size}");
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black12,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          //CREO L'IMMAGINE DEL ROMBO
          //recupero lo stato e resto a guardarne i cambiamenti

          return BlocBuilder<GameCubit, GameState>(
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
          );
        },
      ),
    );
  }
}
