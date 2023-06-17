import 'package:chatpal/cameraUtil.dart';
import 'package:chatpal/loginPage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  File? profileImage;
  void _showCameraDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Handle "Take a Live Picture" button pressed
                  final image = await cameraUtil.openCamera(context);
                  setState(() {
                    profileImage = image;
                  });
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  // Add your logic to capture a live picture here
                },
                child: const Text('Take a Live Picture'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Handle "Select from Gallery" button pressed
                  final image = await cameraUtil.openGallery(context);
                  setState(() {
                    profileImage = image;
                  });

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  // Add your logic to select a picture from the gallery here
                },
                child: const Text('Select from Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF114357),
        title: const Text('chatPAL'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Handle "Settings" menu item pressed
                Navigator.pop(context); // Close the drawer
                // Add your logic for handling "Settings" here
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                // Handle "Log Out" menu item pressed
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                }// Close the drawer
                // Add your logic for handling "Log Out" here
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children:  [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 15.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.pink,
                      backgroundImage: profileImage != null
                          ? MemoryImage(profileImage!.readAsBytesSync())
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: (){
                        _showCameraDialog(context);
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
