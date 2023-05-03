import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Teachers/admin/studentsection.dart';
import 'package:flutter_application_5/screen/screen.dart';
import 'package:flutter_application_5/student/studentdashboard.dart';

class SAuthService{
  final auth= FirebaseAuth.instance;
  TextEditingController email=TextEditingController();
  TextEditingController spassword=TextEditingController();
  TextEditingController student_name=TextEditingController();
  final firestore=FirebaseFirestore.instance;

  void LoginUser(context) async{
    try{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth.signInWithEmailAndPassword(email: email.text, password:spassword.text).then((value) {
        print("user logged in");
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentDashBoardScreen()));
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>StudentDashBoardScreen()), (route) => false);
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
      await auth.createUserWithEmailAndPassword(email: email.text, password: spassword.text).then((value) {
        print("User is registered");
        firestore.collection("Students").add({
          "Student id":email.text,
          "Student name":student_name.text,
          "password":spassword.text,
          "uid":auth.currentUser!.uid,
        });
        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentSectionScreen()));

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
  void logOutUser(context)async{
    await auth.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Screen()), (route) => false);
  }


}
