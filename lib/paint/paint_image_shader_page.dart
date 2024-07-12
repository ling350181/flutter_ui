import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class PaintImageShaderPage extends StatefulWidget {
  const PaintImageShaderPage({Key? key}) : super(key: key);

  @override
  State<PaintImageShaderPage> createState() => _PaintImageShaderPageState();
}

class _PaintImageShaderPageState extends State<PaintImageShaderPage> {
  ui.Image? _img;

  @override
  void initState() {
    super.initState();
    Future(() async {
      _img = await getUiImage('asset/images/car.jpeg');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Wrap(
                  children: TileMode.values
                      .map(
                        (e) => Column(
                          children: [
                            _img != null
                                ? SizedBox(
                                    height: 200,
                                    width: 180,
                                    child: CustomPaint(
                                      painter: ImagePainter(e, _img),
                                    ),
                                  )
                                : Container(),
                            Text(e.toString())
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 画像をロードしてui.Imageへ変換
  Future<ui.Image> getUiImage(String imageAssetPath) async {
    final ByteData assetImageByteData = await rootBundle.load(imageAssetPath);
    final codec = await ui.instantiateImageCodec(assetImageByteData.buffer.asUint8List(),
        targetHeight: 100, targetWidth: 100);
    return (await codec.getNextFrame()).image;
  }
}

class ImagePainter extends CustomPainter {
  final ui.Image? image;
  final TileMode tileMode;

  ImagePainter(this.tileMode, this.image);
  @override
  void paint(Canvas canvas, Size size) {
    if (image == null) return;
    canvas.translate(100, 100);
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;

    paint.shader = ImageShader(
      image!,
      tileMode,
      tileMode,
      Matrix4.rotationZ(0).storage,
    );
    // 半径50の円
    canvas.drawCircle(
      const Offset(0, 0),
      50,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
