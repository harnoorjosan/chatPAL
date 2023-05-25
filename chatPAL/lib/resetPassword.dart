import 'package:chatpal/resetPasswordSuccess.dart';
import 'package:flutter/material.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                child: Text('Reset Your Password',style: TextStyle(
                  color: Colors.black, fontSize: 33.0,
                ),),
              ),
            ),
            const SizedBox(height: 10.0,),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right:25.0),
              child: Center(child: Text('Enter a new password to reset the password on your account',style: TextStyle(color: Colors.black,fontSize: 15.0),)),
            ),
            const SizedBox(height: 20.0,),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text('New Password*',
                style: TextStyle(color: Colors.black,
                    fontSize: 16.0,
                fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5.0,),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: '***********',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.key),
                  prefixIconColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Icon(Icons.check_circle, size: 15.0,),
              ),
              SizedBox(width: 10.0,),
              Text('Must be 10 Characters Long',style: TextStyle(color: Colors.black, fontSize: 15.0),)
            ],),
            Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Icon(Icons.check_circle, size: 15.0,),
              ),
              SizedBox(width: 10.0,),
              Text('Must contain a number',style: TextStyle(color: Colors.black, fontSize: 15.0),)
            ],),
            Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Icon(Icons.check_circle, size: 15.0,),
              ),
              SizedBox(width: 10.0,),
              Text('Must contain a special character',style: TextStyle(color: Colors.black, fontSize: 15.0),)
            ],),
            Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Icon(Icons.check_circle, size: 15.0,),
              ),
              SizedBox(width: 10.0,),
              Text('Must contain a Uppercase and Lowercase Letter',style: TextStyle(color: Colors.black, fontSize: 15.0),)
            ],),
            const SizedBox(height: 20.0,),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text('Confirm Password*',
                style: TextStyle(color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5.0,),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,right: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: '***********',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.key),
                  prefixIconColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetPasswordSuccess(),
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
                  'Reset Password',
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
