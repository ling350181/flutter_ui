import 'package:flutter/material.dart';

class OutlinedBorderPage extends StatelessWidget {
  const OutlinedBorderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Wrap(
          children: [
            SizedBox(
              width: 200,
              child: Material(
                color: Colors.orangeAccent,
                shape: const CircleBorder(side: BorderSide(width: 5, color: Colors.red)),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  child: const Text(
                    "CircleBorder",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Material(
                  color: Colors.orangeAccent,
                  shape: const ContinuousRectangleBorder(
                    side: BorderSide(width: 5, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    child: const Text(
                      "ContinuousRectangleBorder",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Material(
                  color: Colors.orangeAccent,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(width: 5, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    child: const Text(
                      "RoundedRectangleBorder",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Material(
                  color: Colors.orangeAccent,
                  shape: const StadiumBorder(side: BorderSide(width: 5, color: Colors.red)),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    child: const Text(
                      "StadiumBorder",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Material(
                  color: Colors.orangeAccent,
                  shape: const BeveledRectangleBorder(
                    side: BorderSide(width: 5, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    child: const Text(
                      "BeveledRectangleBorder",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
