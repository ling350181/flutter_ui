import 'package:flutter/material.dart';

class FittedBoxPage extends StatelessWidget {
  const FittedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Wrap(
                  spacing: 80,
                  runSpacing: 50,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: BoxFit.values
                      .toList()
                      .map(
                        (mode) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              //alignment: Alignment.center,
                              width: 80,
                              height: 140,
                              color: Colors.yellow.withAlpha(88),
                              child: FittedBox(
                                fit: mode,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.lightGreen,
                                  child: Text(mode.toString().split('.')[0]),
                                ),
                              ),
                            ),
                            Text('$mode'),
                          ],
                        ),
                      )
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
