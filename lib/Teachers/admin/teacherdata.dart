import 'dart:io';
//import 'dart:math';
import 'dart:typed_data';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/admin/teachersection.dart';

//import 'inputdata.dart';

class TeacherData extends StatefulWidget {
  const TeacherData({Key? key}) : super(key: key);

  @override
  State<TeacherData> createState() => _TeacherDataState();
}

class _TeacherDataState extends State<TeacherData> {
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
        title: Text("Teacher Information"),
        leading: BackButton(
          onPressed: (() {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherSectionScreen()));
          }),
        ),
      ),
      body: Container(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("teachersdata").snapshots(),
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
                                      Text("Teacher id:",style: TextStyle(
                                         // fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      //SizedBox(width: 20,),
                                      Text(
                                        snapshot
                                            .data!.docChanges[index].doc['teacher_id'],
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
                                    Text("Name:"),
                                    //SizedBox(width: 30,),
                                    Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['Name'],
                                      style: TextStyle(
                                       // fontSize: 12,
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
                                    Text("Mobile No:"),
                                    //SizedBox(width: 20,),
                                    Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['Mobile No'],
                                      style: TextStyle(
                                       // fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                                Container(
                                padding: EdgeInsets.all(8.0),
                                //width: 160,
                                child: Row(
                                  children: [
                                    Text("Address:"),
                                    //SizedBox(width: 20,),
                                    Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['Address'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                                Container(
                                padding: EdgeInsets.all(8.0),
                                //width: 160,
                                child: Row(
                                  children: [
                                    Text("Aadhar Card Number:"),
                                    //SizedBox(width: 20,),
                                    Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['Aadharcard Number'],
                                      style: TextStyle(
                                      //  fontSize: 12,
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
                             
                              /*IconButton(
                                  onPressed: () {
                                   showModalSheet();
                                  },
                                  icon: Icon(Icons.edit)),
                                  SizedBox(height: 30,),*/
                               
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
