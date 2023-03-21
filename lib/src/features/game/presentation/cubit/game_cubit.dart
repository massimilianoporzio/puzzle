import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/puzzle.dart';
import '../../domain/entities/tile.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  late AudioPlayer player;
  GameCubit() : super(GameState.initial()) {
    player = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
  }

  Puzzle get puzzle => state.puzzle;

  void onTileTapped(Tile tile) async {
    final canMove = puzzle.canMove(tile.position);
    if (canMove) {
      player.stop();
      player.setPlaybackRate(1.0);
      player.play(AssetSource('click.mp3'));
      emit(state.copyWith(puzzle: puzzle.move(tile)));
    }
  }

  void resetPuzzle() async {
    player.stop();
    player.setPlaybackRate(1.5);

    emit(state.copyWith(reset: true));
    player.play(AssetSource('reset.mp3'));

    emit(GameState.initial());
  }
}
