import 'package:flutter/material.dart';

class InputBorderPage extends StatelessWidget {
  const InputBorderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: Colors.orangeAccent,
                shape: const OutlineInputBorder(),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  height: 80,
                  child: const Text(
                    "OutlineInputBorder",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Material(
                  color: Colors.orangeAccent,
                  shape: const UnderlineInputBorder(),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    height: 80,
                    child: const Text(
                      "UnderlineInputBorder",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
