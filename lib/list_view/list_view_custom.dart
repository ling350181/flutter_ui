import 'package:flutter/material.dart';

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('custom'),
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(
          List.generate(100, (index) => ListTile(title: Text('Item $index'))),
        ),
      ),
    );
  }
}
