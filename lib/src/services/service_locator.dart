import 'package:get_it/get_it.dart';
import 'package:puzzle/src/features/game/presentation/cubit/game_cubit.dart';

final sl = GetIt.I;
Future<void> init() async {
  //*BLOCS/CUBITS
  //*game cubit
  sl.registerFactory<GameCubit>(
    () => GameCubit(),
  );
}
