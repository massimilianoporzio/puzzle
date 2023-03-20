import 'package:flutter/material.dart';

class Tile1Painter extends CustomPainter {
  final Color color;
  final int index;

  Tile1Painter({
    required this.color,
    required this.index,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    Path path = Path();
    //CASI PER L'INDICE
    switch (index) {
      case 1:
        path.moveTo(size.width, 0);
        path.lineTo(size.width * 0.5, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.close();
        break;
      case 2:
        path.moveTo(0, 0);
        path.lineTo(size.width * 0.5, size.height);
        path.lineTo(0, size.height);
        path.lineTo(0, 0);
        path.close();
        break;
      case 3:
        path.moveTo(size.width * 0.5, 0);
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(size.width * 0.5, 0);
        path.close();
        break;
      case 4:
        path.moveTo(size.width * 0.5, 0);
        path.lineTo(size.width, size.height);
        path.lineTo(0, size.height);
        path.lineTo(0, 0);
        path.lineTo(size.width * 0.5, 0);
        path.close();
        break;
      case 5:
        path.moveTo(0, 0);
        path.lineTo(size.width * 0.5, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(0, 0);
        path.close();
        break;
      case 6:
        path.moveTo(0, 0);
        path.lineTo(0, size.height);
        path.lineTo(size.width * 0.5, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(0, 0);
        path.close();
        break;
      case 7:
        path.moveTo(size.width * 0.5, 0);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(size.width * 0.5, 0);
        path.close();
        break;
      case 8:
        path.moveTo(size.width * 0.5, 0);
        path.lineTo(0, 0);
        path.lineTo(0, size.height);
        path.lineTo(size.width * 0.5, 0);
        path.close();
        break;
      default:
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
