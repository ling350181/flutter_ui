import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  const PaddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: ColoredBox(
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                color: Colors.blue,
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Container(
                    padding: const EdgeInsets.all(28.0),
                    margin: const EdgeInsets.all(18.0),
                    color: Colors.red,
                    child: const ColoredBox(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
