import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/student/studentdashboard.dart';

//import 'inputdata.dart';

class ViewAttendence extends StatefulWidget {
  const ViewAttendence({Key? key}) : super(key: key);

  @override
  State<ViewAttendence> createState() => _ViewAttendenceState();
}

class _ViewAttendenceState extends State<ViewAttendence> {
  final _fkey = GlobalKey<FormState>();
 
   final firebase=FirebaseFirestore.instance;
   final auth= FirebaseAuth.instance;
   final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("ATTENDENCE"),
        leading: BackButton(
          onPressed: (() {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentDashBoardScreen()));
          }),
        ),
      ),
      body: Container(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
              .collection("Student_Attendence")
              .where("student_id",isEqualTo: currentUser.currentUser!.email)
              .snapshots(),
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
                        height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.9,
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
                                      Text("Student id:",style: TextStyle(
                                         // fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      //SizedBox(width: 20,),
                                      Text(
                                        snapshot
                                            .data!.docChanges[index].doc['student_id'],
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
                              Row(
                                children:[
                              Container(
                                padding: EdgeInsets.all(8.0),
                              //  width: 160,
                                child: Row(
                                  children: [
                                    Text("Class:"),
                                    //SizedBox(width: 30,),
                                    Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['Class'],
                                      style: TextStyle(
                                        //fontSize: 12,
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
                                    Text("Subject:"),
                                    //SizedBox(width: 20,),
                                    Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['Subject'],
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
                                height: 10,
                              ),*/
                       
                          ]),
                           Container(
                                padding: EdgeInsets.all(8.0),
                                //width: 160,
                                child: Row(
                                  children: [
                                      Text("Attendence:"),
                                      Row(
                                        children: [
                                              Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['No_of_classattend'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                        Text("/"),
                                         Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['Total_no_of_class'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),


                                        ],
                                      )

                                  ],
                                ),
                                
                                    
                                    //SizedBox(width: 20,),
                                  
                                  
                                
                              ),
                          
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
