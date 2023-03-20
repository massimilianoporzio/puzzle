part of 'game_cubit.dart';

class GameState extends Equatable {
  final int cols; //numero colonne
  final int rows; //numero di righe
  final Puzzle puzzle; //il nostro gioco di cui tenere conto
  final bool solved; //puzzle risolto?
  final int moves; //numero di mosse fatte

  const GameState({
    required this.cols,
    required this.rows,
    required this.puzzle,
    required this.solved,
    required this.moves,
  });
  //all'inizio 4x4 non risolto e con zero mosse
  factory GameState.inital() => GameState(
        cols: 2,
        rows: 5,
        puzzle: Puzzle.create(2, 5), //2 colonne 5 righe dumura
        solved: false,
        moves: 0,
      );

  @override
  String toString() {
    return 'GameState(cols: $cols, rows: $rows, puzzle: $puzzle, solved: $solved, moves: $moves)';
  }

  @override
  List<Object> get props {
    return [
      cols,
      rows,
      puzzle,
      solved,
      moves,
    ];
  }

  GameState copyWith({
    int? cols,
    int? rows,
    Puzzle? puzzle,
    bool? solved,
    int? moves,
  }) {
    return GameState(
      cols: cols ?? this.cols,
      rows: rows ?? this.rows,
      puzzle: puzzle ?? this.puzzle,
      solved: solved ?? this.solved,
      moves: moves ?? this.moves,
    );
  }
}
