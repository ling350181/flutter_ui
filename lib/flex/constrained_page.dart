import 'package:flutter/material.dart';

class ConstrainedPage extends StatelessWidget {
  const ConstrainedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
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
