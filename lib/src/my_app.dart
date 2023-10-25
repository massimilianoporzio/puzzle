import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/src/features/game/presentation/cubit/sound/sound_cubit.dart';

import 'package:puzzle/src/features/game/presentation/pages/game_page.dart';
import 'package:puzzle/src/services/service_locator.dart';

import 'features/game/presentation/cubit/game/game_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<GameCubit>(
            create: (context) => sl<GameCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<SoundCubit>(),
          )
        ],
        child: const GamePage(),
      ),
    );
  }
}
