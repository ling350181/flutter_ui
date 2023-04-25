import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';
import 'dart:ui' as ui;

class CanvasDrawImagePage extends StatefulWidget {
  const CanvasDrawImagePage({Key? key}) : super(key: key);

  @override
  State<CanvasDrawImagePage> createState() => _CanvasDrawImagePageState();
}

class _CanvasDrawImagePageState extends State<CanvasDrawImagePage> {
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
              painter: DrawImagePainter(_image),
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

class DrawImagePainter extends CustomPainter with DrawGridPain {
  final ui.Image? image;

  DrawImagePainter(this.image);
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    drawGrid(canvas, size);
    final Paint _paint = Paint();
    // 描画スタートはCanvasの中心へ移動
    canvas.translate(size.width / 2, size.height / 2);
    _paint.color = Colors.green;
    if (image != null) {
      canvas.drawImage(image!, Offset(-image!.width / 2, -image!.height / 2), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
