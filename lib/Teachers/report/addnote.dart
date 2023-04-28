import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_5/Teachers/report/home.dart';



class addnote extends StatelessWidget {
   TextEditingController studentid=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController course=TextEditingController();
   TextEditingController subject=TextEditingController();
  TextEditingController exam=TextEditingController();
  TextEditingController marks=TextEditingController();
  TextEditingController tmarks=TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('report');
    final auth= FirebaseAuth.instance;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          MaterialButton(onPressed: (){
            ref.add({
                'student_id':studentid.text,
                'name': name.text,
                'course': course.text,
               'subject':subject.text,
                'exam': exam.text,
                'marks': marks.text,
                'total_marks': tmarks.text,
                  "uid":auth.currentUser!.uid,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
           
             },
             child:Text("Save",style: TextStyle(fontSize: 20,color: Colors.white),) ),
             MaterialButton(onPressed: (){
              Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));

             },
             child:Text("Back",style: TextStyle(fontSize: 20,color: Colors.white),) )
        ]),
        body: SingleChildScrollView(child: Column(
          children: [
             Container(
              padding: EdgeInsets.all(12.0),
              //decoration: BoxDecoration(border: Border.all()),
              child: 
              TextField(
                controller: studentid,
                decoration: InputDecoration(
                  hintText: 'Student id'),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(12.0),
              //decoration: BoxDecoration(border: Border.all()),
              child: 
              TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name'),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: course,
                maxLines: null,
                decoration: InputDecoration(hintText: 'Course'),
              ),
            ),
             SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(12.0),
              //decoration: BoxDecoration(border: Border.all()),
              child: 
              TextField(
                controller: subject,
                decoration: InputDecoration(
                  hintText: 'Subject'),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: exam,
                maxLines: null,
                decoration: InputDecoration(hintText: 'Exam'),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: marks,
                maxLines: null,
                decoration: InputDecoration(hintText: 'Marks'),
              ),
            ),
             SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(12.0),
              //decoration: BoxDecoration(border: Border.all()),
              child: 
              TextField(
                controller: tmarks,
                decoration: InputDecoration(
                  hintText: 'Total Marks'),
              ),
            ),
          ],
        )),
    );
  }
}