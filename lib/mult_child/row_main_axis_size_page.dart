import 'package:flutter/material.dart';

class RowMainAxisSizePage extends StatelessWidget {
  const RowMainAxisSizePage({Key? key}) : super(key: key);

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
        child: Column(
          children: MainAxisSize.values
              .map((e) => Column(
                    children: [
                      Container(
                        height: 100,
                        // 横方向の制約なし
                        // 緩い制約
                        margin: const EdgeInsets.all(5),
                        color: Colors.grey,
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisSize: e,
                          children: [
                            blueBox,
                            redBox,
                            yellowBox,
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
              .toList(),
        ),
      ),
    );
  }
}
