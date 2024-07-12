import 'package:flutter/material.dart';

class EditModal extends StatelessWidget {
  const EditModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 70,
        color: Colors.white,
        child: Wrap(
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("クリア"),
            ),
          ],
        ));
  }
}
