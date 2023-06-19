import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chatpal/loginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  Future<void> signUp(String flag) async {
    try {
      if (flag == 'EmailAndPassword') {
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        final user = userCredential.user!;
        await FirebaseFirestore.instance.collection('users').doc(
            usernameController.text).set({
          'Uid': user.uid,
          'Name': nameController.text,
        }).then((value) {
          //signUp successful
          FirebaseAuth.instance.currentUser!.updateDisplayName(
              nameController.text);
          if (context.mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          }
        }).catchError((e) {
          if (kDebugMode) {
            print(e);
          }
        });
      }
      else if (flag == 'Google') {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth = await googleUser
            ?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        final userCredential = await FirebaseAuth.instance.signInWithCredential(
            credential);
        final user = userCredential.user!;

        //TODO : replace this with new data if a set username page is made
        String randomUsername = generateRandomUsername();
        await FirebaseFirestore.instance.collection('users')
            .doc(randomUsername)
            .set({
          'Uid': user.uid,
          'Name': user.displayName,
        })
            .then((value) {
          //signUp successful
          FirebaseAuth.instance.currentUser!.updateDisplayName(
              nameController.text);
          if (context.mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          }
        }).catchError((e) {
          if (kDebugMode) {
            print(e);
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      //handle invalid signUp data
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: "The account already exists for this email.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
        );
      } else if (e.code == 'invalid-email') {
        Fluttertoast.showToast(
          msg: "The email address is invalid.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
        );
      } else {
        Fluttertoast.showToast(
          msg: "An error occurred. Please try again later.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "An error occurred. Please try again later.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.black,
      );
    }
  }

  String generateRandomUsername() {
    // Generate a username with a random string and current timestamp
    const characters =
        '+-*=?AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    Random random = Random();
    String randomString = String.fromCharCodes(Iterable.generate(
        5, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
    String timestamp = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    String username = '$randomString$timestamp';
    return username;
  }

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
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.key),
                          prefixIconColor: Colors.black,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons
                                  .visibility_off,
                              color: Colors.black,
                            ), onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          ),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: TextField(
                        controller: confirmPasswordController,
                        obscureText: !isConfirmPasswordVisible,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.key),
                          prefixIconColor: Colors.black,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ), onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible =
                              !isConfirmPasswordVisible;
                            });
                          },
                          ),
                        ),
                      ),
                    ),
                    /*
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Text(
                            'Terms and Conditions',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (bool? value) {
                                  setState(() {
                                    value = true;
                                  });
                                }
                            )],
                          ),
                          ]
                        ),
                      ),
                     */
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: ElevatedButton(onPressed: () {
                        if (nameController.text.isEmpty || usernameController.text.isEmpty || emailController.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "Please enter all the mandatory fields.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          );
                        }
                        else {
                          if (isPasswordValid()) {
                            signUp('EmailAndPassword');
                          }
                        }
                      },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFD36675)),
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(200.0, 60.0),
                          ),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
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
                      child: Text('OR', style: TextStyle(
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
                            onTap: () {
                              signUp('Google');
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
                            onTap: () {},
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
                        child: Text(
                          'Already have a account? ', style: TextStyle(
                            color: Colors.black, fontSize: 16.0),),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text('Log In', style: TextStyle(
                              color: Color(0xFFD36675),
                              fontWeight: FontWeight.bold
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

  bool isPasswordValid() {
    if (passwordController.text == confirmPasswordController.text) {
      if (passwordController.text.isNotEmpty) {
        // Define the criteria for a valid password
        const minLength = 10;
        final hasUppercase = RegExp(r'[A-Z]').hasMatch(passwordController.text);
        final hasLowercase = RegExp(r'[a-z]').hasMatch(passwordController.text);
        final hasSpecialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(
            passwordController.text);
        // Check if the password meets all the criteria
        if (passwordController.text.length >= minLength &&
            hasUppercase &&
            hasLowercase &&
            hasSpecialCharacters) {
          return true;
        }
        else {
          Fluttertoast.showToast(
            msg: "This password is too weak.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white,
            textColor: Colors.black,
          );
          return false;
        }
      } else {
        Fluttertoast.showToast(
          msg: "Please enter a password.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
        );
        return false;
      }
    } else {
      Fluttertoast.showToast(
        msg: "Passwords do not match.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.black,
      );
      return false;
    }
  }
}
