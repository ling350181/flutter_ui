import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class CanvasDrawRectPage extends StatelessWidget {
  const CanvasDrawRectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: DrawRectPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawRectPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    drawGrid(canvas, size);
    final Paint _paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.grey;
    // x軸
    canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), _paint);
    canvas.drawLine(Offset(size.width - 10, (size.height / 2) - 10),
        Offset(size.width, size.height / 2), _paint);
    canvas.drawLine(Offset(size.width - 10, (size.height / 2) + 10),
        Offset(size.width, size.height / 2), _paint);
    // y軸
    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), _paint);
    canvas.drawLine(Offset(size.width / 2 - 10, 10), Offset(size.width / 2, 0), _paint);
    canvas.drawLine(Offset(size.width / 2 + 10, 10), Offset(size.width / 2, 0), _paint);
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    _paint.color = Colors.blue;

    //中心から矩形を描く
    Rect rectFromCenter = Rect.fromCenter(
      center: const Offset(0, 0),
      width: 160,
      height: 160,
    );
    canvas.drawRect(rectFromCenter, _paint);

    // 左上右下から矩形を描く
    Rect rectFromLTRB = const Rect.fromLTRB(-120, -120, -80, -80);
    canvas.drawRect(rectFromLTRB, _paint..color = Colors.red);

    // 左上幅高さから矩形を描く
    Rect rectFromLTWH = const Rect.fromLTWH(80, -120, 40, 40);
    canvas.drawRect(rectFromLTWH, _paint..color = Colors.orange);

    // 内接円から矩形を描く
    Rect rectFromCircle = Rect.fromCircle(
      center: const Offset(100, 100),
      radius: 20,
    );
    canvas.drawRect(rectFromCircle, _paint..color = Colors.green);

    // ポイントから矩形を描く
    Rect rectFromPoints = Rect.fromPoints(
      const Offset(-120, 80),
      const Offset(-80, 120),
    );
    canvas.drawRect(rectFromPoints, _paint..color = Colors.purple);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
