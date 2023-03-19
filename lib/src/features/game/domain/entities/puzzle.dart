//rappresenta un puzzle (lista di tiles)
import 'package:equatable/equatable.dart';

import 'package:puzzle/src/features/game/domain/entities/position.dart';
import 'package:puzzle/src/features/game/domain/entities/tile.dart';

class Puzzle extends Equatable {
  final List<Tile> tiles;
  final Position emptyPosition; //pos dello spazio vuoto

  const Puzzle._({
    required this.tiles,
    required this.emptyPosition,
  });

  factory Puzzle.create(int cols, int rows) {
    final tiles = <Tile>[]; //lista iniziale vuota
    int value = 1; //valore della tessera
    final emptyPos = Position(x: cols, y: cols);
    for (var y = 1; y <= cols; y++) {
      for (var x = 0; x <= rows; x++) {
        final add = !(x == rows &&
            y == cols); //poss agg tessere o sono nel posto del spazio vuoto?
        if (add) {
          final pos = Position(x: x, y: y);
          final tile = Tile(value: value, position: pos, correctPosition: pos);
          tiles.add(tile); //agg alla lista iniziale
          value++;
        }
      } //fine giro sulle x (colonne)
    } //fine giro sulle y (righr)

    return Puzzle._(tiles: tiles, emptyPosition: emptyPos);
  }

  @override
  List<Object> get props => [tiles, emptyPosition];
}
