import 'package:flutter/material.dart';

class SizedOverflowBoxPage extends StatelessWidget {
  const SizedOverflowBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.topLeft,
          width: 250,
          height: 150,
          color: Colors.lightGreen,
          child: LayoutBuilder(
            builder: (_, constraints) {
              print("OverflowBox 親から受けた制約: ${constraints}");
              return Center(
                child: SizedOverflowBox(
                  alignment: Alignment.topLeft,
                  size: const Size(150, 150),
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      print("OverflowBox 機能している制約: ${constraints}");
                      return const SizedBox(
                        height: 30,
                        width: 30,
                        child: ColoredBox(
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
