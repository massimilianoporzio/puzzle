import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';
import 'package:puzzle/src/bloc_observer.dart';
import 'src/services/service_locator.dart' as di;
import 'src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(logPrinter: const PrettyPrinter());
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
