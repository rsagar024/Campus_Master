import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/meeting/introauth.dart';
import 'package:flutter_application_5/meeting/signin.dart';

import 'homemeeting.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/pictures/meeting.png",height: 200,),
        SizedBox(height: 30,),
        Center(child: Text("WELCOME TO Meeting",style:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 30))),
         SizedBox(height: 10,),
        Center(child: Text("The best video confrencing App",style:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 12))),
        SizedBox(height: 20,),
        ElevatedButton.icon(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>MeetingSignin()));
        }, icon: Icon(Icons.arrow_circle_right), label: Text("Lets Start"))
      ],
     )
    );
  }
}