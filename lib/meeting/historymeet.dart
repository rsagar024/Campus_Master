import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/student/studentdashboard.dart';
import 'package:intl/intl.dart';


class HistoryMeet extends StatefulWidget {
  const HistoryMeet({Key? key}) : super(key: key);

  @override
  State<HistoryMeet> createState() => _HistoryMeetState();
}

class _HistoryMeetState extends State<HistoryMeet> {
  final currentUser = FirebaseAuth.instance;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('meetingattend').snapshots();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.transparent,
      body:StreamBuilder(stream: _usersStream,builder:(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
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
                   /* Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                           editnote(docid: snapshot.data!.docs[index]),
                      ),
                    );*/
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
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['meetingName'],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),
                          ),
                          subtitle: /*Text(
                            snapshot.data!.docChanges[index].doc['meetingDate'].toDate()
                          ,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),*/Text(
                'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['meetingDate'].toDate())}',
                style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
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
          
      },)
    );
  }
}