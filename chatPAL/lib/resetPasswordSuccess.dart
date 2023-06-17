import 'package:flutter/material.dart';

import 'loginPage.dart';

class ResetPasswordSuccess extends StatefulWidget {
  const ResetPasswordSuccess({Key? key}) : super(key: key);

  @override
  State<ResetPasswordSuccess> createState() => _ResetPasswordSuccessState();
}

class _ResetPasswordSuccessState extends State<ResetPasswordSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: EdgeInsets.only(left:15.0,right: 25.0),
              child: Center(
                child: Text('Password was successfully reset!',style: TextStyle(
                  color: Colors.black, fontSize: 24.0,
                ),),
              ),
            ),
            const SizedBox(height: 20.0,),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right:25.0),
              child: Center(child: Text('Password has been reset, proceed back to log in page',style: TextStyle(color: Colors.black,fontSize: 15.0),)),
            ),
            const SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );

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
                  'Back to Login',
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
