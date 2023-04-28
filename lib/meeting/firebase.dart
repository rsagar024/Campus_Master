import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_5/meeting/meethelper.dart';

/*class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance;
    MAuthService mauthService = MAuthService();
  


  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingHis => _firestore.collection('meet_user').doc(mauthService.currentUser.uid).collection('meetings').snapshots();


  void addToMeetingHistory(String meetingName) async {
    try {
    await _firestore.collection('meet_user').doc(mauthService.currentUser.uid).collection('meetings').add({
      'meetingName': meetingName,
      'meetingDate': DateTime.now(),
    });
    } catch (e) {print(e);}
  }
}*/