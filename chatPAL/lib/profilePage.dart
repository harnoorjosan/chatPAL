import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Profile Page",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
      ),
    );
  }
}