import 'package:flutter/material.dart';

class PuzzleTile extends StatelessWidget {
  final double width;
  final double height;

  const PuzzleTile({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      color: Colors.amber,
      height: height,
      width: width,
    );
  }
}
