import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:puzzle/src/features/game/presentation/cubit/sound/sound_cubit.dart';

import '../features/game/presentation/cubit/game/game_cubit.dart';

final sl = GetIt.I;
Future<void> init() async {
  //*BLOCS/CUBITS
//sound cubit
  sl.registerLazySingleton<SoundCubit>(() => SoundCubit());

  //*game cubit
  sl.registerFactory<GameCubit>(
    () => GameCubit(soundCubit: sl<SoundCubit>()),
  );
}
