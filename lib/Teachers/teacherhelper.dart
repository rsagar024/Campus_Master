import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Teachers/admin/teachersection.dart';
import 'package:flutter_application_5/Teachers/dashboard.dart';
import 'package:flutter_application_5/screen/screen.dart';


class AuthService{
  final auth= FirebaseAuth.instance;
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController Teacher_name=TextEditingController();
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
      await auth.signInWithEmailAndPassword(email: email.text, password:password.text).then((value) {
        print("user logged in");
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardScreen()));
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>DashBoardScreen()), (route) => false);
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
        print("User is registered");
        firestore.collection("Teachers").add({
          "Teacher id":email.text,
          "Teacher name":Teacher_name.text,
          "password":password.text,
          "uid":auth.currentUser!.uid,
        });
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherSectionScreen()));

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
