
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_5/meeting/meethelper.dart';
import 'package:flutter_application_5/meeting/meeting_screen.dart';
import 'package:jitsi_meet_v1/feature_flag/feature_flag.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';

//String roomName='123456';
//String userName='raja';
class JitsiMeetMethods{
   final firebase=FirebaseFirestore.instance;
 final auth =FirebaseAuth.instance;
  // MAuthService authService = MAuthService();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
   String userName='',

  })async{
    try{
      FeatureFlag featureFlag=FeatureFlag();
      featureFlag.welcomePageEnabled=false;
      featureFlag.inviteEnabled=false;
      featureFlag.tileViewEnabled=true;
      featureFlag.chatEnabled=false;
      featureFlag.raiseHandEnabled=false;
      featureFlag.resolution=FeatureFlagVideoResolution.MD_RESOLUTION;
    //  String name;
      

     
      
     

      var options=JitsiMeetingOptions(room: roomName)
      ..userDisplayName=auth.currentUser?.email
      //..userEmail=auth.currentUser?.email
      ..audioMuted=isAudioMuted
      ..videoMuted=isVideoMuted;

      await JitsiMeet.joinMeeting(options);

    }catch(e){
      print("error:$e");
    }
  }

}