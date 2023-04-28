import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/meeting/videoconfrence/createmeeting.dart';
import 'package:flutter_application_5/meeting/videoconfrence/joinmeeting.dart';

class HomeMeeting extends StatefulWidget {
  const HomeMeeting({Key? key}) : super(key: key);

  @override
  State<HomeMeeting> createState() => _HomeMeetingState();
}

class _HomeMeetingState extends State<HomeMeeting> with SingleTickerProviderStateMixin{
 late TabController tabController;
  buildtab(String sname){
    return Container(
      width: 150,
      height: 50,
      child: Card(child: Center(
        child: Text(sname,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      )),
    );
  }

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(title:Text("Meeting"),
    bottom:TabBar(
      controller: tabController,
      tabs:[
      buildtab("Join Meeting"),
      buildtab("Create Meeting")

    ],),),
    body: TabBarView(
      controller: tabController,
      children: [
      JoinMeeting(),
      CreateMeeting()
    ]),
    
   ); 
  }
}