import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/meeting/jitsi_meet_methods.dart';
import 'package:uuid/uuid.dart';

class CreateMeeting extends StatefulWidget {
  const CreateMeeting({Key? key}) : super(key: key);

  @override
  State<CreateMeeting> createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  final JitsiMeetMethods _jitsiMeetMethods=JitsiMeetMethods();
  String code='';
  createcode(){
    setState(() {
      code=Uuid().v1().substring(0,6);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text("Create a code and share it with your friends",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Text("Code:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
              Text(code,style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 20),)
            ],
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap:(){
              createcode();
            },
            child: Container(width: MediaQuery.of(context).size.width/2,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(child: Text("create code")),),
          )

        ],
      ),
    );
  }
}