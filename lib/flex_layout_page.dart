import 'package:flutter/material.dart';
import 'package:flutter_ui/flex/constrained_page.dart';

class FlexLayoutPage extends StatelessWidget {
  const FlexLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex Layout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
                side: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConstrainedPage(),
                  ),
                );
              },
              child: const Text("Change Constrained"),
            ),
          ],
        ),
      ),
    );
  }
}
