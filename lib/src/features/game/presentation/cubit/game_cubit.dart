import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/puzzle.dart';
import '../../domain/entities/tile.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState.inital());

  Puzzle get puzzle => state.puzzle;

  void onTileTapped(Tile tile) {
    final canMove = puzzle.canMove(tile.position);
    if (canMove) {
      emit(state.copyWith(puzzle: puzzle.move(tile)));
    }
  }
}
