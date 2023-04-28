import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/admin/adminnotice.dart';
import 'package:flutter_application_5/Teachers/admin/studentsection.dart';
import 'package:flutter_application_5/Teachers/admin/teachersection.dart';
import 'package:flutter_application_5/Teachers/admin/viewnotice2.dart';
import 'package:flutter_application_5/Teachers/attendence/homeattendence.dart';
import 'package:flutter_application_5/Teachers/notice.dart';
import 'package:flutter_application_5/Teachers/provideassignment.dart';
import 'package:flutter_application_5/Teachers/report/home.dart';
import 'package:flutter_application_5/Teachers/teacherhelper.dart';
import 'package:flutter_application_5/Teachers/teacherprofile.dart';

import '../../meeting/homemeet2.dart';

class AdminDashBoardScreen extends StatefulWidget {
  const AdminDashBoardScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashBoardScreen> createState() => _AdminDashBoardScreenState();
}

class _AdminDashBoardScreenState extends State<AdminDashBoardScreen> {
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
              Navigator.push(context, MaterialPageRoute(builder: ((context) => TeacherSectionScreen())));
            }
            if (index == 1) {
              //2.item
             Navigator.push(context, MaterialPageRoute(builder: ((context) => StudentSectionScreen())));
            }
            if (index == 2) {
              //3.item
               Navigator.push(context, MaterialPageRoute(builder: ((context) => NoticeScreen2())));
            }
            if (index == 3) {
              //4.item
            Navigator.push(context, MaterialPageRoute(builder: ((context) => HomeMeet2())));
            }
             
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
      appBar: AppBar(title: Text("Admin Zone"),
   ),
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
       
                _makeDashboarditems("Teacher Section", "assets/pictures/teacher.jpg", 0),
                 _makeDashboarditems("Student Section", "assets/pictures/student2.png", 1),
                _makeDashboarditems("Notice", "assets/pictures/notice2.png", 2),
                 _makeDashboarditems("Meeting", "assets/pictures/meeting.png", 3),
                 SizedBox(height: 20,),

              
             
           ],))
          ],
        ),),
        )

      ]),
    );
  }
}

