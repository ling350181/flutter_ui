import 'package:flutter/material.dart';

class RowAxisAlign extends StatelessWidget {
  const RowAxisAlign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    final blueBox = Container(
      alignment: Alignment.center,
      color: Colors.blue,
      height: 20,
      width: 30,
      child: const Text(
        '1',
        style: textStyle,
      ),
    );

    final redBox = Container(
      alignment: Alignment.center,
      color: Colors.red,
      height: 30,
      width: 40,
      child: const Text(
        '2',
        style: textStyle,
      ),
    );

    final yellowBox = Container(
      alignment: Alignment.center,
      color: Colors.orange,
      height: 50,
      width: 30,
      child: const Text(
        '3',
        style: textStyle,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: MainAxisAlignment.values
                .map((e) => Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 260,
                          height: 80,
                          color: Colors.grey,
                          child: Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: e,
                            children: [
                              blueBox,
                              redBox,
                              yellowBox,
                            ],
                          ),
                        ),
                        Text(
                          "MainAxisAlignment." + e.toString().split(".")[1],
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
