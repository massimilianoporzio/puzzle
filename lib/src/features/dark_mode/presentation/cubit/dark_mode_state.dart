// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'dark_mode_cubit.dart';

class DarkModeState extends Equatable {
  final ThemeMode mode;
  const DarkModeState({
    required this.mode,
  });
  

  factory DarkModeState.initial(){
    //leggo da prefs
    final SharedPreferences prefs = sl<SharedPreferences>();
    if(prefs.containsKey("isDark")){
      return const DarkModeState(mode: ThemeMode.dark);
    }
    return const DarkModeState(mode: ThemeMode.light);
  }

  @override
  String toString() {
    
    return "DarkModeState: mode: $mode";
  }


  @override
  List<Object> get props => [mode];

  DarkModeState copyWith({
    ThemeMode? mode,
  }) {
    return DarkModeState(
      mode: mode ?? this.mode,
    );
  }
}


