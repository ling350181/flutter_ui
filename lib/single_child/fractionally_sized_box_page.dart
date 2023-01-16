import 'package:flutter/material.dart';

class FractionallySizedBoxPage extends StatelessWidget {
  const FractionallySizedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 250,
          height: 150,
          color: Colors.lightGreen,
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Center(
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  heightFactor: 0.5,
                  alignment: Alignment.topLeft,
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      return const ColoredBox(
                        color: Colors.red,
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
