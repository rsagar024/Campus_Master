
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/attendence/homeattendence.dart';


class UpdateStudentAttendence extends StatefulWidget {
  const UpdateStudentAttendence({Key? key}) : super(key: key);

  @override
  State<UpdateStudentAttendence> createState() => _UpdateStudentAttendenceState();
}

class _UpdateStudentAttendenceState extends State<UpdateStudentAttendence> {
  

  final _fkey = GlobalKey<FormState>();
  final studentid = TextEditingController();
  final _class = TextEditingController();
  final _sub = TextEditingController();
  final _na = TextEditingController();
  final _ta = TextEditingController();
  final firebase=FirebaseFirestore.instance;
  //final int maxLines = 10;
  final auth= FirebaseAuth.instance;
  Addattendence()async{
    try{
       await firebase.collection("Student_Attendence").doc().set({
        "student_id": studentid.text,
        "Class":_class.text,
        "Subject":_sub.text,
        "No_of_classattend":_na.text,
        "Total_no_of_class":_ta.text,
        "uid":auth.currentUser!.uid,
      
       
      });

    }catch(e){
      print(e);
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Attendence"),
        leading: BackButton(
          onPressed: (() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendenceHome()));
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
              controller:studentid,
              decoration:InputDecoration(
                hintText:"Student id",
                //prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
           // validator: (val) => (val!.isEmpty) ? 'Subject' : null,
            ),
                   const SizedBox(
                    height: 10,
                  ),
                   TextFormField(
              controller:_class,
              decoration:InputDecoration(
                hintText:"Class",
                //prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
          //  validator: (val) => (val!.isEmpty) ? 'Assign Date' : null,
            ), 
      
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
           // validator: (val) => (val!.isEmpty) ? 'Last Date' : null,
            ), 
             const SizedBox(
                    height: 10,
                  ),
           
                   TextFormField(
              controller:_na,
              decoration:InputDecoration(
                hintText:"No. of class attend",
                //prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
           // validator: (val) => (val!.isEmpty) ? 'Last Date' : null,
            ), 
             const SizedBox(
                    height: 10,
                  ),
               TextFormField(
              controller:_ta,
              decoration:InputDecoration(
                hintText:"Total no of classes",
                //prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
           // validator: (val) => (val!.isEmpty) ? 'Last Date' : null,
            ), 
             const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: (){
                    Addattendence();
                    studentid.clear();
                    _class.clear();
                    _sub.clear();
                    _na.clear();
                    _ta.clear();
                  }, child: Text("ADD"),style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            minimumSize: const Size(double.infinity,50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ))
                
          
   
                 
            )]),
      ),
    )));
  }
}
