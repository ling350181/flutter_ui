import 'package:flutter/material.dart';
import 'package:flutter_ui/application/ticket_border.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 450,
          child: Material(
            color: const Color.fromRGBO(57, 147, 161, 1),
            shape: TicketBorder(),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              height: 200,
              child: const Text(
                "TICKET",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
