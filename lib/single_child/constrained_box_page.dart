import 'package:flutter/material.dart';

class ConstrainedBoxPage extends StatelessWidget {
  const ConstrainedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const BoxConstraints addToChild = BoxConstraints(
      maxWidth: 100,
      maxHeight: 280,
      minWidth: 50,
      minHeight: 25,
    );
    return Scaffold(
      body: Center(
        child: Container(
          //alignment: Alignment.topLeft,
          margin: const EdgeInsets.all(5),
          width: 250,
          height: 150,
          color: Colors.red,
          child: LayoutBuilder(
            builder: (_, constraints) {
              print("ConstrainedBox 親から受けた制約: ${constraints}");
              print("ConstrainedBox 自ら設けている制約: ${addToChild}");
              return ConstrainedBox(
                constraints: addToChild,
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
