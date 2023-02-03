import 'package:flutter/material.dart';

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

class DrawRRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    _drawGrid(canvas, size);
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

  void _drawGrid(Canvas canvas, Size size) {
    // 1.描画スタートはキャンパスの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);

    // 右下のグリッド
    _drawGridRight(canvas, size);

    canvas.save();
    // X軸の鏡像
    canvas.scale(1, -1);
    _drawGridRight(canvas, size);
    // リセット
    canvas.restore();

    canvas.save();
    // Y軸の鏡像
    canvas.scale(-1, 1);
    _drawGridRight(canvas, size);
    canvas.restore();

    canvas.save();
    // 原点の鏡像
    canvas.scale(-1, -1);
    _drawGridRight(canvas, size);
    canvas.restore();
    canvas.restore();
    final Paint _paint = Paint()
      ..strokeWidth = 2
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
  }

  // 右下のグリッド
  void _drawGridRight(Canvas canvas, Size size) {
    // グリッドの幅
    const double space = 20;
    final Paint _gridPint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = .5
      ..color = Colors.grey;
    // キャンパスの保存
    canvas.save();
    // 2.縦線を描く
    for (int i = 0; i < size.width / 2 / space; i++) {
      // 3.中心をX軸方向へ並行移動し,縦線を描く
      // 4.それを繰り返して処理する
      canvas.drawLine(const Offset(0, 0), Offset(0, size.height / 2), _gridPint);
      canvas.translate(space, 0);
    }
    // 5.中心点をリセットする
    canvas.restore();

    canvas.save();
    // 6.横線を描く
    for (int i = 0; i < size.height / 2 / space; i++) {
      // 7.中心をY軸方向へ並行移動し,横線を描く
      // 8.それを繰り返して処理する
      canvas.drawLine(const Offset(0, 0), Offset(size.width / 2, 0), _gridPint);
      canvas.translate(0, space);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
