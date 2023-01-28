import 'package:flutter/material.dart';

class WrapSpacingPage extends StatelessWidget {
  const WrapSpacingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    final blueBox = Container(
      alignment: Alignment.center,
      color: Colors.blue,
      height: 80,
      width: 80,
      child: const Text(
        '1',
        style: textStyle,
      ),
    );

    final redBox = Container(
      alignment: Alignment.center,
      color: Colors.red,
      height: 100,
      width: 80,
      child: const Text(
        '2',
        style: textStyle,
      ),
    );

    final yellowBox = Container(
      alignment: Alignment.center,
      color: Colors.orange,
      height: 40,
      width: 80,
      child: const Text(
        '3',
        style: textStyle,
      ),
    );

    final greenBox = Container(
      alignment: Alignment.center,
      color: Colors.green,
      height: 50,
      width: 80,
      child: const Text(
        '4',
        style: textStyle,
      ),
    );

    final purpleBox = Container(
      alignment: Alignment.center,
      color: Colors.purple,
      height: 140,
      width: 80,
      child: const Text(
        '5',
        style: textStyle,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Center(
        child: Container(
          height: 350,
          width: 300,
          margin: const EdgeInsets.all(5),
          color: Colors.grey,
          child: Wrap(
            spacing: 10,
            runSpacing: 40,
            children: [
              blueBox,
              redBox,
              yellowBox,
              greenBox,
              purpleBox,
            ],
          ),
        ),
      )),
    );
  }
}
