import 'package:flutter/material.dart';

class messagesPage extends StatelessWidget {
  const messagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: Text(
          "Messages Page",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
      ),
    );
  }
}