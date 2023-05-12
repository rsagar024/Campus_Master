import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/student/studentdashboard.dart';

//import 'inputdata.dart';

class ViewReport extends StatefulWidget {
  const ViewReport({Key? key}) : super(key: key);

  @override
  State<ViewReport> createState() => _ViewReportState();
}

class _ViewReportState extends State<ViewReport> {
  final _fkey = GlobalKey<FormState>();
 
   final firebase=FirebaseFirestore.instance;
   final auth= FirebaseAuth.instance;
   final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Report"),
        leading: BackButton(
          onPressed: (() {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentDashBoardScreen()));
          }),
        ),
      ),
      body: Container(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
              .collection("report")
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
                              Container(
                                padding: EdgeInsets.all(8.0),
                                //width: 160,
                                child: Row(
                                  children: [
                                    Text("Student id:",style: TextStyle(
                                       // fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    SizedBox(width:2,),
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
                               Container(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                                //width: 160,
                                child: Row(
                              children: [
                                Text("Course:"),
                                SizedBox(width: 2,),
                                Text(
                                  snapshot.data!.docChanges[index]
                                      .doc['course'],
                                  style: TextStyle(
                                   // fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                                ),
                              ),
                              
                              /*SizedBox(
                                height: 10,
                              ),*/
                              Container(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                              //  width: 160,
                                child: Row(
                                  children: [
                                    Text("Name:"),
                                    SizedBox(width: 2,),
                                    Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['name'],
                                      style: TextStyle(
                                       // fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              SizedBox(
                                width: 10,
                              ),
                                 Container(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                                //width: 160,
                                child: Row(
                                  children: [
                                      Text("Subject:"),
                                      SizedBox(width: 2,),

                                              Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['subject'],
                                      style: TextStyle(
                                        //fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )

                                    //SizedBox(width: 20,),



                              ),
                          Row(
                            children: [ 
                               SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                                //width: 160,
                                child: Row(
                                  children: [
                                      Text("Exam:"),
                                      SizedBox(width: 2,),
                                   
                                              Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['exam'],
                                      style: TextStyle(
                                        //fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                                    
                                    //SizedBox(width: 20,),
                                  
                                  
                                
                              ),
                             Container(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                                //width: 160,
                                child: Row(
                                  children: [
                                      Text("Marks:"),
                                      Row(
                                        children: [
                                              Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['marks'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                        Text("/"),
                                         Text(
                                      snapshot.data!.docChanges[index]
                                          .doc['total_marks'],
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

                            ],
                          )
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
