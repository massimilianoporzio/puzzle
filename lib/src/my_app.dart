import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/src/app/game_app.dart';
import 'package:puzzle/src/features/dark_mode/presentation/cubit/dark_mode_cubit.dart';
import 'package:puzzle/src/features/game/presentation/cubit/sound/sound_cubit.dart';

import 'package:puzzle/src/services/service_locator.dart';

import 'features/game/presentation/cubit/game/game_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DarkModeCubit>(create: (context) => sl<DarkModeCubit>()),
        BlocProvider<GameCubit>(
          create: (context) => sl<GameCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<SoundCubit>(),
        )
      ],
      child: const GameApp(),
    );
  }
}
