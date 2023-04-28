
//import 'package:attendence_app/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Teachers/admin/studentsection.dart';
import 'package:flutter_application_5/meeting/homemeet2.dart';
import 'package:flutter_application_5/meeting/homemeeting.dart';
import 'package:flutter_application_5/student/studentdashboard.dart';

class MAuthService{
  final auth= FirebaseAuth.instance;
  TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();
   TextEditingController name=TextEditingController();
   final firestore=FirebaseFirestore.instance;
   Stream<User?> get authChanges=> auth.authStateChanges();
   User get user=>auth.currentUser!;

  //var username;

  

  void LoginUser(context) async{
   // User get user=>auth.currentUser!;
    try{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth.signInWithEmailAndPassword(email: email.text, password:password.text).then((value) {
        print("user logged in");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMeet2()));
         //Navigator.pop(context);
      });
    }on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("No user found for that email."),
        );
        
      });
     
  } else if (e.code == 'wrong-password') {
    showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Wrong Password")
        );
      });
  }
}
  }
   void RegisterUser(context) async{
    try{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value) {
       // final User user=auth.currentUser.displayName;
        print("User is registered");
        firestore.collection("meet_user").add({
         "email":email.text,
          "username":name.text,
          "password":password.text,
          "uid":auth.currentUser!.uid,
        });
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMeet2()));
       
      });
    }on FirebaseAuthException catch (e) {
  if (e.code == 'email-already-in-use') {
    showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("The account already exists for that email."),
        );
        
      });
     
  } 
}
    
    catch(e){
      print(e);
    }
  }
  
 
}