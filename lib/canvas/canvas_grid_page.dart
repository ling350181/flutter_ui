import 'package:flutter/material.dart';

class CanvasGridPage extends StatelessWidget {
  const CanvasGridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: GridPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1.描画スタートはキャンパスの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);

    // 右下のグリッド
    _drawGridRight(canvas, size);

    canvas.save();
    // X軸の镜像
    canvas.scale(1, -1);
    _drawGridRight(canvas, size);
    // リセット
    canvas.restore();

    canvas.save();
    // Y軸の镜像
    canvas.scale(-1, 1);
    _drawGridRight(canvas, size);
    canvas.restore();

    canvas.save();
    // 原点の镜像
    canvas.scale(-1, -1);
    _drawGridRight(canvas, size);
    canvas.restore();
  }

  // 右下のグリッド
  void _drawGridRight(Canvas canvas, Size size) {
    // グリッドの幅
    const double space = 20;
    final Paint _gridPint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
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
