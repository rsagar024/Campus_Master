import 'dart:io';
//import 'dart:math';
import 'dart:typed_data';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/student/replyassignmnet.dart';
import 'package:flutter_application_5/student/studentdashboard.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

//import 'inputdata.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({Key? key}) : super(key: key);

  @override
  State<Assignment2> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment2> {
  final _fkey = GlobalKey<FormState>();
  var sub=new TextEditingController();
  bool _isLoading=false;
  FirebaseFirestore firestoreRef=FirebaseFirestore.instance;
  final currentUser=FirebaseAuth.instance;
   final email = TextEditingController();
   final _name = TextEditingController();
   final firebase=FirebaseFirestore.instance;
   final auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ASSIGNMENT"),
        leading: BackButton(
          onPressed: (() {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentDashBoardScreen()));
          }),
        ),
      ),
      body: Container(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Assignment").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.5,
                        width: MediaQuery.of(context).size.width*0.6,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child:GestureDetector(
                          child: Column(
                           // mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              /*SizedBox(
                                height: 10,
                              ),*/
                              Center(
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  //width: 160,
                                  child: Row(
                                    children: [
                                      Text("Subject:",style: TextStyle(
                                         // fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      //SizedBox(width: 20,),
                                      Text(
                                        snapshot
                                            .data!.docChanges[index].doc['Subject'],
                                        style: TextStyle(
                                         // fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              /*SizedBox(
                                height: 10,
                              ),*/
                              Container(
                                padding: EdgeInsets.all(8.0),
                              //  width: 160,
                                child: Row(
                                  children: [
                                    Text("Assign Date:"),
                                    //SizedBox(width: 30,),
                                    Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['Active_Date'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                             /* SizedBox(
                                width: 10,
                              ),*/
                              Container(
                                padding: EdgeInsets.all(8.0),
                                //width: 160,
                                child: Row(
                                  children: [
                                    Text("Last Date:"),
                                    //SizedBox(width: 20,),
                                    Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['Last_Date'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                               /* SizedBox(
                                height: 10,
                              ),*/
                              Container(
                                padding: EdgeInsets.all(8.0),
                                //width: 160,
                                child: 
                                    
                                    //SizedBox(width: 20,),
                                    Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['Assignment'],
                                    )
                                  
                                
                              ),
                              /*IconButton(
                                  onPressed: () {
                                   showModalSheet();
                                  },
                                  icon: Icon(Icons.edit)),
                                  SizedBox(height: 30,),*/
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReplyAssignment()));
                                     
                                      }, child: Text("Reply")),
                                        SizedBox(width: 20,),
                        
                                       ElevatedButton(onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: ((context) => StudentDashBoardScreen())));
                                       }, child: Text("Cancel")),
                        
                                    ],
                                  )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        },
      )),
    );
  }
}
