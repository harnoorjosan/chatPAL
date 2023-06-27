import 'dart:ui';
import 'package:chatpal/cameraUtil.dart';
import 'package:chatpal/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class profilePage extends StatefulWidget {
  const profilePage({super.key});
  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  File? profileImage;
  late final TabController _tabController = TabController(length: 2, vsync: this);


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
                },
                child: const Text('Select from Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: profileImage != null
                        ? Image.file(profileImage!, fit: BoxFit.cover)
                        : const Center(child: Text('No image selected')),
                  ),
                ),
              ),
            ),
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
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false,
                  );
                }

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
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: GestureDetector(
                      onTap: (){
                        _showImageDialog(context);
                        },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.pink,
                        backgroundImage: profileImage != null
                            ? MemoryImage(profileImage!.readAsBytesSync())
                            : null,
                      ),
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
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(text: 'Posts'),
              Tab(text: 'Tweets'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  [
                // Contents of the 'Posts' tab
                GridView.count(
                  crossAxisCount: 3,
                  children: const [
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                  ],
                ),

                // Contents of the 'Tweets' tab
                const Center(
                  child: Text('Tweets'),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}