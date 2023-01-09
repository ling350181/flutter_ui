import 'package:flutter/material.dart';

class SizedBoxPage extends StatelessWidget {
  const SizedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              print("ConstrainedBox 自ら設けている制約: w=100.0, h=25.0");
              return SizedBox(
                height: 25,
                width: 100,
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
