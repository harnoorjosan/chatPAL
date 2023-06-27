import 'package:chatpal/cameraPage.dart';
import 'package:chatpal/feedPage.dart';
import 'package:chatpal/meetPage.dart';
import 'package:chatpal/messagesPage.dart';
import 'package:chatpal/profilePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cIndex = 0;

  final List<Widget> screens = [
    const feedPage(), // Replace with your screen widgets
    const meetPage(),
    const cameraPage(),
    const messagesPage(),
    const profilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: cIndex,
            children: screens,
          ),
          if (cIndex != 2) // Hide bottom navigation bar when camera icon is clicked
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: const Color(0xFF114357),
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.white,
                currentIndex: cIndex,
                onTap: (int index) {
                  setState(() {
                    cIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 30.0),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.tv, size: 30.0),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_a_photo_rounded, size: 30.0),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.message, size: 30.0),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 30.0),
                    label: '',
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}


