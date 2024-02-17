import 'package:flutter/material.dart';

class IntrinsicPage extends StatelessWidget {
  const IntrinsicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IntrinsicHeight'),
      ),
      body: Align(
        alignment: Alignment.topRight,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 120,
                color: Colors.red,
              ),
              Container(
                width: 40,
                height: 80,
                color: Colors.blue,
              ),
              Container(
                width: 40,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
