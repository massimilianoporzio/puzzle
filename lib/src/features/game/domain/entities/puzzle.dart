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
    final emptyPos = Position(x: cols, y: rows);
    // print("INIT EMPTY POSITION TO: $emptyPos");
    for (var y = 1; y <= rows; y++) {
      for (var x = 1; x <= cols; x++) {
        final add = !(y == rows &&
            x == cols); //poss agg tessere o sono nel posto del spazio vuoto?
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

  bool canMove(Position tilePosition, {bool allowMultipleTile = false}) {
    Position emptyPos = emptyPosition;
    // print("EMPTY POS is $emptyPos");
    // print("TILE POS is $tilePosition");
    if (allowMultipleTile) {
      if (tilePosition.y == emptyPos.y || tilePosition.x == emptyPos.x) {
        return true;
      } else {
        return false;
      }
    } else {
      if (tilePosition.y == emptyPos.y &&
          ((tilePosition.x == emptyPos.x + 1) ||
              (tilePosition.x == emptyPos.x - 1))) {
        return true;
      }
      if (tilePosition.x == emptyPos.x &&
          ((tilePosition.y == emptyPos.y - 1) ||
              (tilePosition.y == emptyPos.y + 1))) {
        return true;
      }
      return false;
    }
  }

  //resituisce una nuova istanza di Puzzle con le tiles spostate
  Puzzle move(Tile tile) {
    //mi faccio copia delle tessere originali
    final copy = [...tiles];
    //stessa y muovo in x?
    if (tile.position.y == emptyPosition.y) {
      //prendo la riga con la stessa y della posizione vuota
      final row =
          tiles.where((element) => element.position.y == emptyPosition.y);
      //*DESTRA
      if (tile.position.x < emptyPosition.x) {
        //CICLO PER DARE LA POSS DI SPOSTARE TUTTE LE TESSERE A DESTRA (in questo caso no ma in futuro)
        //E LO SPOSTAMENTO DEVE AVVENIRE SOLO PER LE TESSERE CON LA X >= della tessera su cui ho cliccato
        //MA NON OLTRE QUELLA DELLO SPAZIO VUOTO
        for (final t in row) {
          if (t.position.x < tile.position.x ||
              t.position.x > emptyPosition.x) {
            //IGNORO
            continue;
          }
          //assegno nuova posizione alla tile
          copy[t.value - 1] =
              t.move(Position(x: t.position.x + 1, y: t.position.y));
        }
      } else {
        //*SINISTRA
        for (final t in row) {
          if (t.position.x > tile.position.x ||
              t.position.x < emptyPosition.x) {
            //IGNORO
            continue;
          }
          copy[t.value - 1] =
              t.move(Position(x: t.position.x - 1, y: t.position.y));
        }
      }
    } else {
      //muovo in y
      //prendo la colonna con la stessa x della posizione vuota
      final column =
          tiles.where((element) => element.position.x == emptyPosition.x);
      if (tile.position.y < emptyPosition.y) {
        //*BASSO
        for (final t in column) {
          if (t.position.y < tile.position.y ||
              t.position.y > emptyPosition.y) {
            //IGNORO
            continue;
          }
          //assegno nuova posizione alla tile
          copy[t.value - 1] =
              t.move(Position(x: t.position.x, y: t.position.y + 1));
        }
      } else {
        //*VERSO L'ALTO
        for (final t in column) {
          if (t.position.y > tile.position.y ||
              t.position.y < emptyPosition.y) {
            //IGNORO
            continue;
          }
          copy[t.value - 1] =
              t.move(Position(x: t.position.x, y: t.position.y - 1));
        }
      }
    }
    return Puzzle._(
      tiles: copy,
      emptyPosition: tile.position, //al posto della tessera resta il vuoto
    );
  }

  @override
  List<Object> get props => [tiles, emptyPosition];
}
