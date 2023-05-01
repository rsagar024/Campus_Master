import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Teachers/attendence/editattendence.dart';
import 'package:flutter_application_5/Teachers/attendence/updateattendence.dart';
import 'package:flutter_application_5/Teachers/dashboard.dart';



class AttendenceHome extends StatefulWidget {
  @override
  _AttendenceHomeState createState() => _AttendenceHomeState();
}

class _AttendenceHomeState extends State<AttendenceHome> {
  final auth= FirebaseAuth.instance;
   final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => UpdateStudentAttendence()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Students Attendence'),
        leading: BackButton(onPressed: (() {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => DashBoardScreen()));
        }),),
      ),
      body: StreamBuilder(
        stream:  FirebaseFirestore.instance
                                .collection("Student_Attendence")
                                .where("uid",
                                    isEqualTo: currentUser.currentUser!.uid)
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

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                             editstudentattendence(docid: snapshot.data!.docs[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: 3,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['student_id'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                         
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}