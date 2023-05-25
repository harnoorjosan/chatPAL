import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD36675),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFFD36675),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: Text(
                          'chatPal',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Connecting Pals, one chat at a time!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0
                          ),
                        ),
                      ),

                    ]
                ),
              ),
            ),
          ),
          Expanded(flex: 8,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     const Padding(
                       padding: EdgeInsets.all(15.0),
                       child: Text('Create an Account',

                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                        ),),
                     ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Full Name*',
                        style: TextStyle(color: Colors.black,
                            fontSize: 16.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'Name Surname',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Username*',
                        style: TextStyle(color: Colors.black,
                            fontSize: 16.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'UserXYZ',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Email*',
                        style: TextStyle(color: Colors.black,
                            fontSize: 16.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'email@email.com',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Password*',
                        style: TextStyle(color: Colors.black,
                            fontSize: 16.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: '*************',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(Icons.key),
                          prefixIconColor: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Confirm Password*',
                        style: TextStyle(color: Colors.black,
                            fontSize: 16.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: '*************',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(Icons.key),
                          prefixIconColor: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: ElevatedButton(onPressed: (){
                        print('Button Pressed');
                      },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFD36675)),
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(200.0, 60.0),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ), child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),),
                    ),
                    const SizedBox(height: 20.0),
                    const Center(
                      child: Text('OR',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: GestureDetector(
                            onTap: (){
                              print('Icon clicked');
                            },
                            child: const Icon(
                              FontAwesomeIcons.google,
                              size: 50,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: GestureDetector(
                            onTap: (){
                              print('Icon clicked');
                            },
                            child: const Icon(
                              FontAwesomeIcons.apple,
                              size: 50,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 90.0),
                        child: Text('Already have a account? ',style: TextStyle(color: Colors.black,fontSize: 16.0),),
                      ),
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Text('Log In', style: TextStyle(
                              color: Color(0xFFD36675),fontWeight: FontWeight.bold
                          ),)
                      ),

                    ],)
                  ],

          ),
              ),
            ),
          ),
      ],
    ),

    );

  }
}
