import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/position.dart';
import '../../domain/entities/puzzle.dart';
import '../../domain/entities/tile.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState.inital());

  bool canMove(Position tilePosition) {
    Position emptyPos = state.puzzle.emptyPosition;
    // print("EMPTY POS is $emptyPos");
    // print("TILE POS is $tilePosition");
    if (tilePosition.y == emptyPos.y &&
        ((tilePosition.x == emptyPos.x + 1) ||
            (tilePosition.x == emptyPos.x - 1))) {
      return true;
    }
    if (tilePosition.x == emptyPos.x &&
        ((tilePosition.y == emptyPos.y - 1) ||
            (tilePosition.y == emptyPos.y + 1))) {
      return true;
    }
    return false;
  }

  void onTileTapped(Tile tile) {
    print("can Move this tile? ${canMove(tile.position)}");
  }
}
