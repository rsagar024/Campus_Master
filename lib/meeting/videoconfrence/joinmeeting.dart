//import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/meeting/jitsi_meet_methods.dart';
import 'package:jitsi_meet_v1/feature_flag/feature_flag.dart';
//import 'package:jitsi_meet/jitsi_meet.dart';

//import 'package:jitsi_meet_v1/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({Key? key}) : super(key: key);

  @override
  State<JoinMeeting> createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController username=TextEditingController();
    TextEditingController room=TextEditingController();
  bool isVideoMuted=true;
  bool isAudioMuted=true;
  final JitsiMeetMethods _jitsiMeetMethods=JitsiMeetMethods();
  
 
  joinmeeting()async{
 //   String roomname=room.text;

//    _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    try{
      Map<FeatureFlagEnum,bool>featureflags={
        FeatureFlagEnum.WELCOME_PAGE_ENABLED:false
      };
     
      var options=JitsiMeetingOptions(room: room.text)
      ..userDisplayName=username.text
      ..audioMuted=isAudioMuted
      ..videoMuted=isVideoMuted
      ..featureFlags.addAll(featureflags);
     
      await JitsiMeet.joinMeeting(options);
     
    }catch(e){
      print(e);
    }
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 24,),
             Text("Room Code",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
               SizedBox(height: 20,),
               PinCodeTextField( length: 6, onChanged: (value){},
               autoDisposeControllers: false,
               animationType: AnimationType.fade,
               pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline
               ),
               animationDuration: Duration(milliseconds: 300), appContext: context,),
                 SizedBox(height: 10,),
                 TextField(
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "name(Leave if you want your name)"
                  ),
                 ),
                 SizedBox(height: 16,),
                 CheckboxListTile(value: isVideoMuted, onChanged: (value){
                  setState(() {
                    isVideoMuted=value!;
                  });
                 },
                 title: Text("Video muted"),),
                   SizedBox(height: 16,),
                 CheckboxListTile(value: isAudioMuted, onChanged: (value){
                  setState(() {
                    isAudioMuted=value!;
                  });
                 },
                 title: Text("Audio muted"),),
                  SizedBox(height: 20,),
                 Text("of course, you can customise your setting in the meeting"),
                 Divider(height: 48,thickness: 2.0,),
                  InkWell(
            onTap:()=>joinmeeting(),
            child: Container(width: double.maxFinite,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(child: Text("Join Meeting")),),
          )
          ]),
        ),
      ),
    );
  }
}