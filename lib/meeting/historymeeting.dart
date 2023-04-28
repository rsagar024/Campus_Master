import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/meeting/firebase.dart';

import 'package:intl/intl.dart';


class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final firebase=FirebaseFirestore.instance;
   final auth= FirebaseAuth.instance;
   final currentUser = FirebaseAuth.instance;
    return StreamBuilder(
      stream:  FirebaseFirestore.instance
                                .collection("meetings")
                                .where("uid",
                                    isEqualTo: currentUser.currentUser!.uid)
                                .snapshots(),
        builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount:(snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
              ),
              subtitle: Text(
                'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['meetingDate'].toDate())}',
              ),
            )
        );

        });
  }
}