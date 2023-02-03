import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class CanvasDrawRRectPage extends StatelessWidget {
  const CanvasDrawRRectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: DrawRRectPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawRRectPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    drawGrid(canvas, size);
    final Paint _paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.grey;

    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    _paint.color = Colors.blue;

    //中心から角丸矩形を描く
    Rect rectFromCenter = Rect.fromCenter(
      center: const Offset(0, 0),
      width: 160,
      height: 160,
    );
    canvas.drawRRect(RRect.fromRectXY(rectFromCenter, 40, 40), _paint);

    // 左上右下から角丸矩形を描く
    RRect fromLTRBXY = const RRect.fromLTRBXY(-120, -120, -80, -80, 10, 10);
    canvas.drawRRect(fromLTRBXY, _paint..color = Colors.red);

    // 左上右下円半径から角丸矩形を描く
    RRect fromLTRBR = RRect.fromLTRBR(80, -120, 120, -80, const Radius.circular(10));
    canvas.drawRRect(fromLTRBR, _paint..color = Colors.orange);

    // 左上右下と各コーナの円で角丸矩形を描く
    RRect fromLTRBAndCorners = RRect.fromLTRBAndCorners(
      80,
      80,
      120,
      120,
      topLeft: const Radius.circular(10),
      topRight: const Radius.circular(10),
      bottomRight: const Radius.circular(10),
      bottomLeft: const Radius.circular(10),
    );
    canvas.drawRRect(fromLTRBAndCorners, _paint..color = Colors.green);

    // 矩形と各コーナの円で角丸矩形を描く
    Rect rectFromPoints = Rect.fromPoints(
      const Offset(-120, 80),
      const Offset(-80, 120),
    );
    RRect fromRectAndCorners = RRect.fromRectAndCorners(
      rectFromPoints,
      bottomLeft: const Radius.circular(10),
      topLeft: const Radius.circular(10),
      topRight: const Radius.circular(10),
      bottomRight: const Radius.circular(10),
    );
    canvas.drawRRect(fromRectAndCorners, _paint..color = Colors.purple);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
