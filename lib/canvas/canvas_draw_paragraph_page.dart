import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_ui/canvas/draw_grid_paint.dart';

class CanvasDrawParagraphPage extends StatelessWidget {
  const CanvasDrawParagraphPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomPaint(
              painter: DrawParagraphPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawParagraphPainter extends CustomPainter with DrawGridPain {
  @override
  void paint(Canvas canvas, Size size) {
    // グリッド線
    drawGrid(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);

    // 1. paragraphBuilderで段落のスタイルParagraphStyleを設定し
    final paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        textAlign: TextAlign.center,
        fontWeight: FontWeight.bold,
      ),
    );

    // 2. TextStyleはテキストの色とサイズを設定する
    final textStyle = ui.TextStyle(
      color: Colors.red,
      fontSize: 28,
    );
    // 3. pushStyleでテキストスタイルを追加します。
    paragraphBuilder.pushStyle(textStyle);
    // 4. addTextメソッドを使用してテキストを追加します。
    paragraphBuilder.addText("Hello, world!");

    // 5. paragraphBuilder.build()で段落を作成します。
    final paragraph = paragraphBuilder.build();
    // 6. paragraph.layoutで段落の寸法を計算してレイアウトします。
    paragraph.layout(ui.ParagraphConstraints(width: size.width / 2));

    // 7. drawParagraphメソッドを使用してキャンバス上に描画されます。
    canvas.drawParagraph(paragraph, Offset.zero);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
