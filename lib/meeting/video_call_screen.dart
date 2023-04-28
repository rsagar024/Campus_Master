import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/meeting/jitsi_meet_methods.dart';
import 'package:flutter_application_5/meeting/meethelper.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'meeting_buttonoptions.dart';

class VideoCallScreen extends StatefulWidget {
  static const String id = 'VideoCallScreen';
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
   
   _VideoCallScreenState();
 // MAuthService authService = MAuthService();
  late TextEditingController meetingIdController;
  late TextEditingController email;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  final firebase=FirebaseFirestore.instance;
 final auth =FirebaseAuth.instance;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  late Stream<User?> authStateChanges;
  

  @override
  void initState() {
    meetingIdController = TextEditingController();
    email= TextEditingController(
      text:auth.currentUser!.email,
    );
     
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    email.dispose();
    JitsiMeet.removeAllListeners();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
        title: const Text(
          'Join a Meeting',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: TextField(
                controller: meetingIdController,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: Color.fromRGBO(46, 46, 46, 1),
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                ),
              ),
            ),
          
           SizedBox(
              height: 60,
              child: TextField(
                controller: email,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  fillColor: Color.fromRGBO(46, 46, 46, 1),
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'email',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              highlightColor: Colors.blueAccent,
              onTap: _joinMeeting,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 26),
                child: Text(
                  'Join',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            MeetingOption(
              text: 'Mute Audio',
              isMute: isAudioMuted,
              onChange: onAudioMuted,
            ),
            MeetingOption(
              text: 'Turn Off My Video',
              isMute: isVideoMuted,
              onChange: onVideoMuted,
            ),
          ],
        ),
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }


  _joinMeeting() async{
try{
   await firebase.collection("meetingattend").doc().set({
        'meetingName': meetingIdController.text,
         'userEmail': email.text,
        "uid":auth.currentUser!.uid,
        'meetingDate':DateTime.now(),
      
       
      });
  
}catch(e){
  print(e);
}



    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      userName: email.text,
    );
  }

}
