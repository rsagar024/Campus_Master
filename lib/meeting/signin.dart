import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/meeting/homemeeting.dart';
import 'package:flutter_application_5/meeting/meethelper.dart';
import 'package:flutter_application_5/meeting/signup.dart';

class MeetingSignin extends StatefulWidget {
  const MeetingSignin({Key? key}) : super(key: key);

  @override
  State<MeetingSignin> createState() => _MeetingSigninState();
}

class _MeetingSigninState extends State<MeetingSignin> {
   final email = TextEditingController();
  final password = TextEditingController();
   bool hide=true;
  MAuthService mauthService=MAuthService();
  final _fkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Text("Login",style:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 30))),
              SizedBox(height: 30,),
              TextFormField(
                  controller: mauthService.email,
                  decoration:InputDecoration(
                    hintText:"email",
                    prefixIcon: Icon(Icons.email),
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                validator: (val) => (val!.isEmpty) ? 'email' : null,
                 keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                  TextFormField(
                    controller: mauthService.password,
                    obscureText: hide,
                  decoration:InputDecoration(
                    hintText:"Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        hide=!hide;
                      });
        
                    },icon: hide?Icon(Icons.visibility_off):Icon(Icons.visibility),),
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                   validator: (val) => (val!.isEmpty) ? 'Enter Password' : null,
                ),
                   const SizedBox(
                  height: 10,
                ),
                  ElevatedButton(
                onPressed: (){
                if (mauthService.email!=""&&mauthService.password!="") {
                     mauthService.LoginUser(context);
                    }
                
                    
                }, child: Text("Sign-In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                minimumSize: const Size(double.infinity,50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
               ),),
                   const SizedBox(
                  height: 10,
                ),
                
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MeetingSignup()));
                      }, child: Text("Dont have account?register"))),
                  
            ],
          ),
        ),
      ),
    );
  }
}