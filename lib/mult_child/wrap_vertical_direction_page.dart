import 'package:flutter/material.dart';

class WrapVerticalDirectionPage extends StatelessWidget {
  const WrapVerticalDirectionPage({Key? key}) : super(key: key);

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
      height: 40,
      width: 40,
      child: const Text(
        '3',
        style: textStyle,
      ),
    );

    final greenBox = Container(
      alignment: Alignment.center,
      color: Colors.green,
      height: 20,
      width: 40,
      child: const Text(
        '4',
        style: textStyle,
      ),
    );

    final purpleBox = Container(
      alignment: Alignment.center,
      color: Colors.purple,
      height: 40,
      width: 30,
      child: const Text(
        '5',
        style: textStyle,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: VerticalDirection.values
                .map((e) => Column(
                      children: [
                        Container(
                          height: 150,
                          width: 120,
                          margin: const EdgeInsets.all(5),
                          color: Colors.grey,
                          child: Wrap(
                            verticalDirection: e,
                            children: [
                              blueBox,
                              redBox,
                              yellowBox,
                              greenBox,
                              purpleBox,
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
      ),
    );
  }
}
