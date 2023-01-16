import 'package:flutter/material.dart';

class OverflowBoxPage extends StatelessWidget {
  const OverflowBoxPage({Key? key}) : super(key: key);
  final double maxWidth = 300;
  final double maxHeight = 300;
  final double minWidth = 50;
  final double minHeight = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: maxWidth,
          height: maxHeight,
          color: Colors.yellow.withAlpha(33),
          child: Center(
            child: Container(
              width: 250,
              height: 150,
              color: Colors.green.withAlpha(33),
              child: LayoutBuilder(
                builder: (_, constraints) {
                  print("OverflowBox 親から受けた制約: ${constraints}");
                  print("OverflowBox(${minWidth}<=w<=${maxWidth}, ${minHeight}<=h<=${maxHeight})");
                  return OverflowBox(
                    maxHeight: maxHeight,
                    maxWidth: maxWidth,
                    minWidth: minWidth,
                    minHeight: minHeight,
                    child: LayoutBuilder(
                      builder: (_, constraints) {
                        print("OverflowBox 機能している制約: ${constraints}");
                        // 親のサイズを超える
                        return const SizedBox(
                          height: 350,
                          child: ColoredBox(
                            color: Colors.blue,
                          ),
                        );
                        // サイズ定義なしの場合
                        // return const ColoredBox(
                        //   color: Colors.blue,
                        // );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
