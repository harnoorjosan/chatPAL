import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF114357 ),
        title: const Text('chatPAL'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon pressed
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: const Color(0xFF114357 ),
        //
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: cIndex,
        onTap: (int index){
          setState(() {
            cIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30.0,),label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.tv, size: 30.0),label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_rounded, size: 30.0), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message, size: 30.0), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 30.0), label: ''),
        ],



      ),
      body: const Center(child: Text("Oops you don't have any friends", style: TextStyle(color: Colors.black, fontSize: 25.0),)),
    );
  }
}
