
import 'package:get_it/get_it.dart';
import 'package:puzzle/src/features/dark_mode/presentation/cubit/dark_mode_cubit.dart';
import 'package:puzzle/src/features/game/presentation/cubit/sound/sound_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/game/presentation/cubit/game/game_cubit.dart';

final sl = GetIt.I;
Future<void> init() async {
  //shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  sl.registerSingleton(prefs);
  //*BLOCS/CUBITS
  //theme mode cubit
  sl.registerFactory<DarkModeCubit>(() => DarkModeCubit());
//sound cubit
  sl.registerLazySingleton<SoundCubit>(() => SoundCubit());

  //*game cubit
  sl.registerFactory<GameCubit>(
    () => GameCubit(soundCubit: sl<SoundCubit>()),
  );
}
