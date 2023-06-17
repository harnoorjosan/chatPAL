import 'package:flutter/material.dart';

class feedPage extends StatelessWidget {
  const feedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Feed Page",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
      ),
    );
  }
}