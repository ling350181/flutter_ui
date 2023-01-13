import 'package:flutter/material.dart';

class LimitedBoxPage extends StatelessWidget {
  const LimitedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 25;
    const double maxHeight = 150;
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.all(5),
          width: 250,
          height: 150,
          color: Colors.red,
          child: LayoutBuilder(
            builder: (_, constraints) {
              print("ConstrainedBox 親から受けた制約: ${constraints}");
              print("ConstrainedBox 自ら設けている制約: width:${maxWidth} height:${maxHeight}");
              return LimitedBox(
                maxHeight: 25,
                maxWidth: 100,
                child: LayoutBuilder(
                  builder: (_, realConstraints) {
                    print("ConstrainedBox 機能している制約: ${realConstraints}");
                    return const ColoredBox(
                      color: Colors.blue,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
