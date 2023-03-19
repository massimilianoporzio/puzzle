import 'package:equatable/equatable.dart';

import 'position.dart';

class Tile extends Equatable {
  final int value; //valore della tesserina (1,2,3)
  final Position position; //posizione corrente
  final Position correctPosition; //posizione giusta per risolvere il puzzle

  const Tile({
    required this.value,
    required this.position,
    required this.correctPosition,
  });

  //fa muovere una tessera
  Tile move(Position newPosition) {
    return copyWith(position: newPosition);
  }

  @override
  List<Object> get props => [value, position, correctPosition];

  Tile copyWith({
    int? value,
    Position? position,
    Position? correctPosition,
  }) {
    return Tile(
      value: value ?? this.value,
      position: position ?? this.position,
      correctPosition: correctPosition ?? this.correctPosition,
    );
  }
}
