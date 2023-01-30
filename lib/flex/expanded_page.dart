import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  const ExpandedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(width: 50, child: ColoredBox(color: Colors.red)),
            Expanded(child: SizedBox(width: 50, child: ColoredBox(color: Colors.blue))),
            SizedBox(width: 50, child: ColoredBox(color: Colors.yellow)),
          ],
        ),
      ),
    );
  }
}
