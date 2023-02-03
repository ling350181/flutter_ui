import 'package:flutter/material.dart';

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

class DrawRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    _drawGrid(canvas, size);
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
