import 'package:flutter/material.dart';

class AlignFactor extends StatelessWidget {
  const AlignFactor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(5),
          //alignment: Alignment.topLeft,
          color: Colors.lightGreen,
          child: const Align(
            //widthFactor: 2,
            heightFactor: 3,
            alignment: Alignment.center,
            child: SizedBox(
              width: 50,
              height: 50,
              child: ColoredBox(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
