import 'package:flutter/material.dart';

class meetPage extends StatelessWidget {
  const meetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Meet Page",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
      ),
    );
  }
}