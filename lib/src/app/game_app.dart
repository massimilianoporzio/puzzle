import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/src/features/game/presentation/pages/game_page.dart';

import '../features/dark_mode/presentation/cubit/dark_mode_cubit.dart';

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeMode = context.watch<DarkModeCubit>().state.mode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<DarkModeCubit>().state.mode,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Color.fromARGB(255, 4, 39, 68),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)),
          primarySwatch: Colors.red,
          brightness:
              themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      home: const GamePage(),
    );
  }
}
