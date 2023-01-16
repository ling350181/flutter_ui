import 'package:flutter/material.dart';

class AlignDemo extends StatelessWidget {
  const AlignDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alignments = [
      Alignment.topLeft,
      Alignment.topCenter,
      Alignment.topRight,
      Alignment.centerLeft,
      Alignment.center,
      Alignment.centerRight,
      Alignment.bottomLeft,
      Alignment.bottomCenter,
      Alignment.bottomRight,
    ];

    final List<String> alignmentsName = [
      "topLeft",
      "topCenter",
      "topRight",
      "centerLeft",
      "center",
      "centerRight",
      "bottomLeft",
      "bottomCenter",
      "bottomRight",
    ];
    return Scaffold(
      body: Center(
        child: Wrap(
            children: alignments
                .toList()
                .map(
                  (mode) => Column(children: <Widget>[
                    Container(
                        margin: const EdgeInsets.all(5),
                        width: 100,
                        height: 60,
                        color: Colors.grey.withAlpha(88),
                        child: Align(
                            child: Container(
                              width: 30,
                              height: 30,
                              color: Colors.blue,
                            ),
                            alignment: mode)),
                    Text(alignmentsName[alignments.indexOf(mode)])
                  ]),
                )
                .toList()),
      ),
    );
  }
}
