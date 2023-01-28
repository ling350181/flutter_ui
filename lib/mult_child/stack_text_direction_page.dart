import 'package:flutter/material.dart';

class StackTextDirectionPage extends StatelessWidget {
  const StackTextDirectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blueBox = Container(
      alignment: Alignment.center,
      color: Colors.blue,
      height: 120,
      width: 120,
    );

    final redBox = Container(
      alignment: Alignment.center,
      color: Colors.red,
      height: 80,
      width: 80,
    );

    final yellowBox = Container(
      alignment: Alignment.center,
      color: Colors.orange,
      height: 60,
      width: 60,
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Wrap(
              children: TextDirection.values
                  .map((e) => Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            margin: const EdgeInsets.all(5),
                            color: Colors.grey,
                            child: Stack(
                              textDirection: e,
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
        ),
      ),
    );
  }
}
