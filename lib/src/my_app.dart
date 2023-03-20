import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/src/features/game/presentation/cubit/game_cubit.dart';
import 'package:puzzle/src/features/game/presentation/pages/game_page.dart';
import 'package:puzzle/src/services/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          )
        ],
        child: const GamePage(),
      ),
    );
  }
}
