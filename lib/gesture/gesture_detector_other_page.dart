import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureDetectorOtherPage extends StatefulWidget {
  const GestureDetectorOtherPage({Key? key}) : super(key: key);

  @override
  State<GestureDetectorOtherPage> createState() => _GestureDetectorOtherPageState();
}

class _GestureDetectorOtherPageState extends State<GestureDetectorOtherPage> {
  double panHeight = 100;
  double scaleHeight = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onPanDown: (DragDownDetails details) {
                print('-----onPanDown---------');
                print('-----タッチポイントからWidget左上の相対偏移値---${details.localPosition}------');
                print('-----タッチポイントから設備スクリーン左上の相対偏移値---${details.globalPosition}------');
              },
              onPanEnd: (DragEndDetails details) {
                print('-----onPanEnd---------');
                print('-----移動終了時の速度---${details.velocity}------');
                print('-----移動方向の初期速度---${details.primaryVelocity}------');
              },
              onPanStart: (DragStartDetails details) {
                print('-----onPanStart---------');
                print('-----ドラッグ開始のタイムスタンプ---${details.sourceTimeStamp}------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');
                print('-----イベントを開始したデバイスの種類---${details.kind}------');
              },
              onPanUpdate: (DragUpdateDetails details) {
                print('-----onLongPressMoveUpdate---------');
                print('-----移動時のタイムスタンプ---${details.sourceTimeStamp}------');
                print('-----毎回移動更新の偏移値---${details.delta}------');
                print('-----移動方向の初期偏移値---${details.primaryDelta}------');
                print('-----Widget相対偏移値---${details.localPosition}------');
                print('-----スクリーン相対偏移値---${details.globalPosition}------');

                if (panHeight > details.delta.dy.abs() + 20 || details.delta.dy > 0) {
                  setState(() {
                    panHeight = panHeight + details.delta.dy;
                  });
                }
              },
              onPanCancel: () {
                print('-----onPanCancel---------');
              },
              child: Center(
                child: Container(
                  color: Colors.blue,
                  height: panHeight,
                  width: 200,
                  child: const Center(
                    child: Text(
                      "Pan",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onScaleStart: (ScaleStartDetails details) {
                print('-----onScaleStart---------');
                print('-----画面に接触しているポインターの最初の焦点---${details.focalPoint}------');
                print('-----画面に接触しているポインターの最初の焦点(Widget)---${details.localFocalPoint}------');
                print('-----ポインタの数(使用される指の数)---${details.pointerCount}------');
              },
              onScaleUpdate: (ScaleUpdateDetails details) {
                print('-----onScaleStart---------');
                print('-----画面に接触しているポインターの最初の焦点---${details.focalPoint}------');
                print('-----画面に接触しているポインターの最初の焦点(Widget)---${details.localFocalPoint}------');
                print('-----ポインタの数(使用される指の数)---${details.pointerCount}------');
                print('-----スケール比率---${details.scale}------');
                print('-----水平スケール比率---${details.horizontalScale}------');
                print('-----縦方向スケール比率---${details.verticalScale}------');
                print('-----回転角度 (ラジアン)---${details.rotation}------');
                setState(() {
                  scaleHeight = 100 * details.verticalScale;
                });
              },
              onScaleEnd: (ScaleEndDetails details) {
                print('-----onScaleEnd---------');
                print('-----イベント終了時の速度---${details.velocity}------');
                print('-----ポインタの数(使用される指の数)---${details.pointerCount}------');
              },
              child: Center(
                child: Container(
                  color: Colors.blue,
                  height: scaleHeight,
                  width: 200,
                  child: const Center(
                    child: Text(
                      "Scale",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
