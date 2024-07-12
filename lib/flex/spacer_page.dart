import 'package:flutter/material.dart';

class SpacerPage extends StatelessWidget {
  const SpacerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: 50, child: ColoredBox(color: Colors.red)),
            Spacer(),
            SizedBox(width: 50, child: ColoredBox(color: Colors.yellow)),
          ],
        ),
      ),
    );
  }
}
