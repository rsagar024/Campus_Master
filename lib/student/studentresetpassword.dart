
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/student/studentlogin.dart';



class SResetPasswordScreen extends StatelessWidget {
 SResetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController Controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Reset Page",style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),
            Padding(padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: Controller,
              decoration: InputDecoration(
                labelText: "Enter your Email-id",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),

            )),
            SizedBox(height:10),
            ElevatedButton(onPressed: (){
              FirebaseAuth.instance.sendPasswordResetEmail(email: Controller.text).then((value) {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentLoginScreen()));

              });
            }, child: Text("Reset Password"),style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            minimumSize: const Size(double.infinity,50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
           ),)


          ]),
        ),
      ),

    );
  }
}