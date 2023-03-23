import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../services/service_locator.dart';
import '../../../domain/entities/puzzle.dart';
import '../../../domain/entities/tile.dart';
import '../sound/sound_cubit.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  late final AudioPlayer player;
  final SoundCubit soundCubit;
  late final StreamSubscription soundSubscription;
  GameCubit({required this.soundCubit}) : super(GameState.initial()) {
    player = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
    soundSubscription = soundCubit.stream.listen((SoundState soundState) {
      player.setVolume(soundState.muted ? 0 : 1);
    });
  }
  @override
  Future<void> close() {
    soundSubscription.cancel();
    return super.close();
  }

  Puzzle get puzzle => state.puzzle;

  void onTileTapped(Tile tile) async {
    final canMove = puzzle.canMove(tile.position, allowMultipleTile: true);
    if (canMove) {
      player.stop();
      player.setPlaybackRate(1.0);
      player.play(AssetSource('click.mp3'));
      emit(state.copyWith(puzzle: puzzle.move(tile)));
    }
  }

  void resetPuzzle() async {
    await player.stop();
    await player.setPlaybackRate(1.5);

    emit(state.copyWith(reset: true));
    await player.play(AssetSource('reset.mp3'));

    emit(GameState.initial());
  }
}
