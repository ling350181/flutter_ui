import 'package:flutter/material.dart';

class StackClipPage extends StatelessWidget {
  const StackClipPage({Key? key}) : super(key: key);

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
      height: 140,
      width: 40,
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: Clip.values
                .map((e) => Column(
                      children: [
                        Container(
                          height: 120,
                          width: 250,
                          margin: const EdgeInsets.all(5),
                          color: Colors.grey,
                          child: Stack(
                            clipBehavior: e,
                            children: [
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
                        Text(
                          e.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ))
                .toList()
                .reversed
                .toList(),
          ),
        ),
      ),
    );
  }
}
