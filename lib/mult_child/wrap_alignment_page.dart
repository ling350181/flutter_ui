import 'package:flutter/material.dart';

class WrapAlignmentPage extends StatelessWidget {
  const WrapAlignmentPage({Key? key}) : super(key: key);

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

    final greenBox = Container(
      alignment: Alignment.center,
      color: Colors.green,
      height: 20,
      width: 20,
      child: const Text(
        '4',
        style: textStyle,
      ),
    );

    final purpleBox = Container(
      alignment: Alignment.center,
      color: Colors.purple,
      height: 80,
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
            children: WrapAlignment.values
                .map((e) => Column(
                      children: [
                        Container(
                          height: 80,
                          width: 260,
                          margin: const EdgeInsets.all(5),
                          color: Colors.grey,
                          child: Wrap(
                            alignment: e,
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
