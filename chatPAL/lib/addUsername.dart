import 'package:chatpal/homePage.dart';
import 'package:chatpal/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addUsername extends StatefulWidget {
  const addUsername({super.key});

  @override
  State<addUsername> createState() => _addUsernameState();
}

class _addUsernameState extends State<addUsername> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Center(
                child: Text('chatPAL',style: TextStyle(
                    color: Color(0xFFD36675), fontSize: 30.0,fontWeight: FontWeight.bold
                ),),
              ),
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Please enter the username',
                style: TextStyle(color: Colors.black,
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.only(left: 15.0,right: 15.0),
              child: TextField(
                decoration: InputDecoration(

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40.0,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );




              },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFc33764 )),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(200.0, 60.0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ), child: const Text(
                  "Let's go",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),),
            ),



          ],
        ),
      ),




    );
  }
}
