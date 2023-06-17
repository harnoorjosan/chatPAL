import 'package:flutter/material.dart';

class cameraPage extends StatelessWidget {
  const cameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Camera Page",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
      ),
    );
  }
}