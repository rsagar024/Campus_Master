import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/admin/admindashboard.dart';
import 'package:flutter_application_5/Teachers/admin/studentnote.dart';
import 'package:flutter_application_5/Teachers/admin/viewnotice2.dart';
import 'package:flutter_application_5/Teachers/attendence/homeattendence.dart';
import 'package:flutter_application_5/Teachers/dashboard.dart';
import 'package:flutter_application_5/Teachers/notice.dart';
import 'package:flutter_application_5/Teachers/provideassignment.dart';
import 'package:flutter_application_5/Teachers/report/home.dart';
import 'package:flutter_application_5/Teachers/teacherhelper.dart';
import 'package:flutter_application_5/Teachers/teacherprofile.dart';
import 'package:flutter_application_5/student/registerstudent.dart';

class NoticeDashBoardScreen extends StatefulWidget {
  const NoticeDashBoardScreen({Key? key}) : super(key: key);

  @override
  State<NoticeDashBoardScreen> createState() => _NoticeDashBoardScreenState();
}

class _NoticeDashBoardScreenState extends State<NoticeDashBoardScreen> {
  Card _makeDashboarditems(String title,String img,int index){
    return Card(
      elevation:1.5,
      child:Container(
        decoration:  BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,17),
            blurRadius: 17,
            spreadRadius: -23,
            color: Colors.grey,
          )
        ]),
        child: InkWell(
          onTap: (() {
                if (index == 0) {
              //1.item
              Navigator.push(context, MaterialPageRoute(builder: ((context) => NoticeScreen())));
            }
            if (index == 1) {
              //2.item
            Navigator.push(context, MaterialPageRoute(builder: ((context) => ViewNotice2())));
            }
        /*    if (index == 2) {
              //3.item
              Navigator.push(context, MaterialPageRoute(builder: ((context) => AttendenceHome())));
            }
            if (index == 3) {
              //4.item
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Home())));
            }
              if (index == 4) {
              //5.item
             Navigator.push(context, MaterialPageRoute(builder: ((context) => NoticeScreen())));
            }
              if (index == 5) {
              //6.item
             // Navigator.push(context, MaterialPageRoute(builder: ((context) => ViewNotice())));
            }*/
          }),
          child: Column(
            children: [
                 const SizedBox(height: 4,),
                  Image.asset(img,height: 80,),
                  const SizedBox(height: 4,),
                  Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),

            ],
          ),
        ),)
    );
  }
  
  @override
  Widget build(BuildContext context) {
    
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Notice"),
      leading: BackButton(onPressed: (() {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => DashBoardScreen())));
      })),),
      body: Stack(children: [
        Container(
          height: size.height*0.45,
          decoration: BoxDecoration(color: Colors.white),
        ),
        SafeArea(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
           SizedBox(height: 10,),
           Expanded(child: GridView.count(crossAxisCount: 2,
           crossAxisSpacing: 20,
           mainAxisSpacing: 20,
           children: [
       
                _makeDashboarditems("Add Notice", "assets/pictures/notice.png", 0),
                 _makeDashboarditems("View Notice", "assets/pictures/notice2.png", 1),
            
             
             
           ],))
          ],
        ),),
        )

      ]),
    );
  }
}

