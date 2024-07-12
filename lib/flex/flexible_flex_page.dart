import 'package:flutter/material.dart';

class FlexibleFlexPage extends StatelessWidget {
  const FlexibleFlexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ColoredBox(color: Colors.red),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: ColoredBox(color: Colors.blue),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ColoredBox(color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
