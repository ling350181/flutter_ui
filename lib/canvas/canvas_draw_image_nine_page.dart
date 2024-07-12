import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';
import 'dart:ui' as ui;

class CanvasDrawImageNinePage extends StatefulWidget {
  const CanvasDrawImageNinePage({Key? key}) : super(key: key);

  @override
  State<CanvasDrawImageNinePage> createState() => _CanvasDrawImageNinePageState();
}

class _CanvasDrawImageNinePageState extends State<CanvasDrawImageNinePage> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: DrawImageNinePainter(_image),
            ),
          ),
        ],
      ),
    );
  }

  void _loadImage() async {
    _image = await loadImageFromAssets('asset/images/car.jpeg');
    setState(() {});
  }

  Future<ui.Image>? loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    return decodeImageFromList(data.buffer.asUint8List());
  }
}

class DrawImageNinePainter extends CustomPainter with DrawGridPain {
  final ui.Image? image;

  DrawImageNinePainter(this.image);
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    drawGrid(canvas, size);
    final Paint _paint = Paint();
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    _paint.color = Colors.green;
    if (image != null) {
      // 画像クリップの領域
      Rect center = Rect.fromCenter(
        center: Offset(image!.width / 2, image!.height / 2),
        width: 100,
        height: 100,
      );
      // 画像表示のCanvas領域
      Rect dst = Rect.fromCenter(
        center: Offset.zero,
        width: 100,
        height: 300,
      );
      canvas.drawImageNine(image!, center, dst, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
