import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sound_state.dart';

class SoundCubit extends Cubit<SoundState> {
  SoundCubit() : super(SoundState.initial());

  void toggleMute() {
    print("TOGGLE MUTE");
    emit(state.copyWith(muted: !state.muted));
  }
}
