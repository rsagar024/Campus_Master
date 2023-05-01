
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/dashboard.dart';


class ProvideAssignment extends StatefulWidget {
  const ProvideAssignment({Key? key}) : super(key: key);

  @override
  State<ProvideAssignment> createState() => _ProvideAssignmentState();
}

class _ProvideAssignmentState extends State<ProvideAssignment> {
  

  final _fkey = GlobalKey<FormState>();
  final _sub = TextEditingController();
  final _actvdate = TextEditingController();
  final _lastdate = TextEditingController();
  final _assign = TextEditingController();
  final firebase=FirebaseFirestore.instance;
  final int maxLines = 10;
  final auth= FirebaseAuth.instance;
  Addassignment()async{
    try{
       await firebase.collection("Assignment").doc().set({
        "Subject": _sub.text,
        "Active_Date":_actvdate.text,
        "Last_Date":_lastdate.text,
        "Assignment":_assign.text,
        "uid":auth.currentUser!.uid,
      
       
      });

    }catch(e){
      print(e);
    }

  }
  Deleteassignment()async{
    try{
      await firebase.collection("Assignment").doc().delete();

    }catch(e){
      print(e);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment"),
        leading: BackButton(
          onPressed: (() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardScreen()));
          }),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        child: Form(
            key: _fkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                   TextFormField(
              controller:_sub,
              decoration:InputDecoration(
                hintText:"Subject",
                //prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
           // validator: (val) => (val!.isEmpty) ? 'Subject' : null,
            ),
                   const SizedBox(
                    height: 10,
                  ),
                   TextFormField(
              controller:_actvdate,
              decoration:InputDecoration(
                hintText:"Assign Date",
                //prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
          //  validator: (val) => (val!.isEmpty) ? 'Assign Date' : null,
            ), 
      
                   const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
              controller:_lastdate,
              decoration:InputDecoration(
                hintText:"Last Date",
                //prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
           // validator: (val) => (val!.isEmpty) ? 'Last Date' : null,
            ), 
   
                 
                        Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
          children: [
              TextField(
                controller: _assign,
                maxLines: maxLines,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                 
                ),
              ),
              SizedBox(height:20),
              ElevatedButton(onPressed: (){
                Addassignment();
              _sub.clear();
              _actvdate.clear();
              _lastdate.clear();
              _assign.clear();
              }, child: Text("ADD")),
               const SizedBox(height:20),
             
               
                ],
              ),
            )]),
      ),
    )));
  }
}
