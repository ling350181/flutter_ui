import 'package:flutter/material.dart';

class ConstrainedPage extends StatelessWidget {
  const ConstrainedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 50,
              child: ColoredBox(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
