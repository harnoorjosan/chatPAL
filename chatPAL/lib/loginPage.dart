import 'package:chatpal/addUsername.dart';
import 'package:chatpal/homePage.dart';
import 'package:chatpal/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chatpal/forgotPassword.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoading = false;
  bool rememberMe = false;
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    retrieveRememberMeData();
  }

  void retrieveRememberMeData() async {
    final emailValue = await storage.read(key: 'email');
    setState(() {
      if (emailValue != null) {
        usernameController.text = emailValue;
      }
    });
  }

  void authenticateUserIn() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text
      );

      if (rememberMe) {
        await storage.write(key: 'email', value: usernameController.text);
      }

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          showErrorMessage('Invalid email address');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          showErrorMessage('Invalid Password');
        }
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Row(
            children: [
              const Icon(
                Icons.warning,
                color: Colors.red,
              ),
              const SizedBox(width: 8),
              Text(message),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Try Again'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                                child: Text('E-mail',
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 16.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0,
                                    right: 15.0),
                                child: TextField(
                                  controller: usernameController,
                                  decoration: const InputDecoration(

                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
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
                              const SizedBox(height: 40.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  children: [
                                    const Text('Password', style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 180.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          // Handle button press event here
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (
                                                  context) => const ForgotPassword(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Forgot your Password?',
                                          style: TextStyle(
                                            color: Color(0xFFc33764),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0,
                                    right: 15.0),
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
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    prefixIcon: const Icon(Icons.key),
                                    prefixIconColor: Colors.black,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
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
                              // Add some spacing between password field and checkbox
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: rememberMe,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          rememberMe = newValue ?? false;
                                        });
                                      },
                                    ),
                                    const Text('Remember Me'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0,
                                    right: 15.0),
                                child: ElevatedButton(onPressed: () {
                                  authenticateUserIn();
                                },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(const Color(0xFFc33764)),
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
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),),
                              ),
                              const SizedBox(height: 40.0,),
                              // const Center(
                              //   child: Text('OR',style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 20.0
                              //   ),),
                              // ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  children: const [
                                    Expanded(child: Divider(color: Colors.black)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        'OR',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Divider(color: Colors.black)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40.0),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100),
                                    child: GestureDetector(
                                      onTap: () async {
                                        try {
                                          // Call the signInWithGoogle method
                                          UserCredential userCredential = await signInWithGoogle();

                                          // If sign-in is successful, navigate to the home page
                                          if (context.mounted) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (
                                                    context) => const addUsername(),
                                              ),
                                            );
                                          }
                                        } catch (e) {
                                          // Handle any errors that occur during sign-in
                                          if (kDebugMode) {
                                            print(
                                                'Sign-in with Google failed: $e');
                                          }
                                        }
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
                                      onTap: () {
                                        if (kDebugMode) {
                                          print('Icon clicked');
                                        }
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
                                  child: Text('Do not have a account?',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SignUp(),
                                        ),
                                      );
                                    },
                                    child: const Text('Sign Up', style: TextStyle(
                                        color: Color(0xFFc33764),
                                        fontWeight: FontWeight.bold
                                    ),)
                                ),

                              ],)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
}
}