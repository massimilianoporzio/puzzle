import 'package:equatable/equatable.dart';

class Position extends Equatable {
  final int x; //posizione nelle colonne
  final int y; //posizione nelle righe

  const Position({
    required this.x,
    required this.y,
  });

  @override
  List<Object> get props => [x, y];

  Position copyWith({
    int? x,
    int? y,
  }) {
    return Position(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  @override
  String toString() => 'Position(x: $x, y: $y)';
}
