import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class PathArcToPage extends StatelessWidget {
  const PathArcToPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: ArcToPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class ArcToPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    canvas.save();
    canvas.translate(-80, 0);

    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    // trueの場合
    var rect = Rect.fromCenter(
      center: const Offset(0, 0),
      width: 100,
      height: 60,
    );

    path
      ..lineTo(15, 15)
      ..arcTo(rect, 0, pi * 1.5, true);

    canvas.drawPath(path, paint);

    path.reset();
    canvas.restore();
    canvas.save();
    canvas.translate(80, 0);
    // falseの場合
    path
      ..lineTo(15, 15)
      ..arcTo(rect, 0, pi * 1.5, false);
    canvas.drawPath(path, paint);

    canvas.restore();
    // text
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = const TextSpan(
      text: "true",
      style: TextStyle(
        color: Colors.red,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(-100, 50));

    textPainter.text = const TextSpan(
      text: "false",
      style: TextStyle(
        color: Colors.red,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(60, 50));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
