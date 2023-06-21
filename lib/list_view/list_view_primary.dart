import 'package:flutter/material.dart';

class ListViewPrimary extends StatelessWidget {
  const ListViewPrimary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('primary'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.red,
              child: const Text('Some header text'),
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              children: const <Widget>[
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Album'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
              ],
            ),
            Container(
              height: 300,
              color: Colors.blue,
              child: const Text('Some footer text'),
            ),
          ],
        ),
      ),
    );
  }
}
