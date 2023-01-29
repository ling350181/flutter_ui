import 'package:flutter/material.dart';

class StackFitPage extends StatelessWidget {
  const StackFitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blueBox = Container(
      alignment: Alignment.center,
      color: Colors.blue,
      height: 80,
      width: 80,
    );

    final yellowBox = Container(
      alignment: Alignment.center,
      color: Colors.yellow,
      height: 40,
      width: 40,
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: StackFit.values
                .map((e) => Column(
                      children: [
                        Container(
                          height: 120,
                          width: 250,
                          margin: const EdgeInsets.all(5),
                          color: Colors.grey,
                          child: Align(
                            // Alignありとなしによって
                            // 親の制約は緩めと厳しめに切り替える
                            alignment: Alignment.centerLeft,
                            child: Stack(
                              fit: e,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  color: Colors.red,
                                ),
                                Positioned(
                                  left: 30,
                                  top: 30,
                                  child: blueBox,
                                ),
                                Positioned(
                                  left: 50,
                                  top: 50,
                                  child: yellowBox,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          e.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
