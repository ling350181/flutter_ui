import 'package:flutter/material.dart';

class BoxBorderPage extends StatelessWidget {
  const BoxBorderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 300,
          child: Material(
            color: Colors.orangeAccent,
            shape: const Border(
              top: BorderSide(
                color: Colors.blue,
                width: 10,
              ),
              left: BorderSide(
                color: Colors.green,
                width: 10,
              ),
              bottom: BorderSide(
                color: Colors.yellow,
                width: 10,
              ),
              right: BorderSide(
                color: Colors.red,
                width: 10,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              height: 80,
              child: const Text(
                "Border",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
