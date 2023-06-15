import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF114357),
          title: const Text('chatPAL'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Handle menu icon pressed
              },
            ),
          ],
        ),
      body: Column(
        children: [
          Row(
            children:  [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 15.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.pink,
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: (){
                      },
                      icon: const Icon(Icons.camera_alt),
                      color: Colors.black,
                      iconSize: 30,
                    ),
                    
                    

                  ),
                ],
              ),
              const SizedBox(width: 90.0),
              const Icon(Icons.people, color: Colors.black,size: 30.0,),
              const SizedBox(width: 5), // Add some separation between the icon and text
              const Text(
                '40',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 40.0),
              const Icon(Icons.key, color: Colors.black,size: 30.0,),
              const SizedBox(width: 5), // Add some separation between the icon and text
              const Text(
                '40',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 40.0),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 300.0),
            child: Text('He/Him',style: TextStyle(fontSize: 20.0),),
          )

        ],
      ),
    );
  }
}