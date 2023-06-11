import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:chatpal/linkSent.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      var users = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (users.isNotEmpty && users.contains('password')){
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        if (context.mounted){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LinkSent(),
            ),
          );
        }

        if (kDebugMode) {
          print('Password reset email sent to $email');
        }
      }

    } catch (e) {
      if (kDebugMode) {
        print('Error sending password reset email: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Text('chatPAL',style: TextStyle(
              color: Color(0xFFD36675), fontSize: 30.0,fontWeight: FontWeight.bold
            ),),
          ),
          const SizedBox(height: 40.0),
          const Padding(
            padding: EdgeInsets.only(left:25.0,right: 25.0),
            child: Center(
              child: Text('Forgot your Password?',style: TextStyle(
                  color: Colors.black, fontSize: 35.0,
              ),),
            ),
          ),
          const SizedBox(height: 20.0,),
          const Padding(
            padding: EdgeInsets.only(left: 25.0,right:25.0),
            child: Center(child: Text('Please enter the email address and we will send you the instructions to reset the password',style: TextStyle(color: Colors.black,fontSize: 15.0),)),
          ),
          const SizedBox(height: 20.0,),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text('Email*',
              style: TextStyle(color: Colors.black,
                  fontSize: 16.0),
            ),
          ),
          const SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 25.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
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
          const SizedBox(height: 50.0,),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: ElevatedButton(onPressed: (){

              sendPasswordResetEmail(emailController.text);

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
                'Send Link',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),),
          ),


        ],
      ),


    );
  }
}
