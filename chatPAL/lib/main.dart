import 'package:chatpal/homePage.dart';
import 'package:chatpal/signUp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chatpal/forgotPassword.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(chatpal());
}

class chatpal extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFD36675),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFc33764),

      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFFc33764  ), Color(0xFF1d2671)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
                )
              ),
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
          Expanded(
            flex: 8,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:  [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: SafeArea(child: Text('Log In',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                    ),)),
                  ),
                  const SizedBox(height: 25.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('Username',
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
                          hintText: 'best_wizard421',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: Colors.black,
                        ),
                      ),
                    ),
                      const SizedBox(height: 40.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children:  [
                            const Text('Password', style: TextStyle(color: Colors.black, fontSize: 16.0), ),

                            Padding(
                              padding: const EdgeInsets.only(left: 180.0),
                              child: GestureDetector(
                                onTap: () {
                                  // Handle button press event here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ForgotPassword(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Forgot your Password?',
                                  style: TextStyle(
                                    color: Color(0xFFc33764 ),
                                  ),
                                ),
                          ),
                            ),

                          ],
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
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),),
                      ),
                      const SizedBox(height: 40.0),
                      const Center(
                        child: Text('OR',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                        ),),
                      ),
                      const SizedBox(height: 40.0),
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
                      const SizedBox(height: 50.0),
                      Row(children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 100.0),
                          child: Text('Do not have a account?',style: TextStyle(color: Colors.black,fontSize: 16.0),),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const signUp(),
                              ),
                            );
                          },
                          child: const Text('Sign Up', style: TextStyle(
                            color: Color(0xFFc33764 ),fontWeight: FontWeight.bold
                          ),)
                        ),

                      ],)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
