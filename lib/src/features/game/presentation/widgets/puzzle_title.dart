import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

import '../../domain/entities/tile.dart';
import 'painters.dart';

class PuzzleTile extends StatelessWidget with UiLoggy {
  final double width;
  final double height;
  final int index;
  final Tile tile;
  final VoidCallback onTap;

  const PuzzleTile({
    Key? key,
    required this.width,
    required this.height,
    required this.index,
    required this.tile,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (tile.position.x - 1) * width + 1,
      top: (tile.position.y - 1) * height + 1,
      child: GestureDetector(
        onTap: onTap,
        onPanEnd: (details) {
          onTap();
        },
        child: Container(
          // margin: const EdgeInsets.all(2.0),
          color: Colors.white,
          height: height - 2,
          width: width - 2,
          alignment: Alignment.center,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(width, height),
                painter:
                    Tile1Painter(color: Colors.deepPurple, index: index + 1),
              ),
              Center(
                child: Text(tile.value.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
