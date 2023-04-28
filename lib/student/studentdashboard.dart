import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/attendence/homeattendence.dart';
import 'package:flutter_application_5/Teachers/notice.dart';
import 'package:flutter_application_5/Teachers/provideassignment.dart';
import 'package:flutter_application_5/Teachers/report/home.dart';
import 'package:flutter_application_5/Teachers/teacherhelper.dart';
import 'package:flutter_application_5/Teachers/teacherprofile.dart';
import 'package:flutter_application_5/meeting/homemeet2.dart';
import 'package:flutter_application_5/student/studentprofile.dart';
import 'package:flutter_application_5/student/viewassignment.dart';
import 'package:flutter_application_5/student/viewattendence.dart';
import 'package:flutter_application_5/student/viewnotice.dart';
import 'package:flutter_application_5/student/viewreport.dart';

class StudentDashBoardScreen extends StatefulWidget {
  const StudentDashBoardScreen({Key? key}) : super(key: key);

  @override
  State<StudentDashBoardScreen> createState() => _StudentDashBoardScreenState();
}

class _StudentDashBoardScreenState extends State<StudentDashBoardScreen> {
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
              Navigator.push(context, MaterialPageRoute(builder: ((context) => StudentProfileScreen())));
            }
            if (index == 1) {
              //2.item
             Navigator.push(context, MaterialPageRoute(builder: ((context) => Assignment2())));
            }
            if (index == 2) {
              //3.item
             Navigator.push(context, MaterialPageRoute(builder: ((context) => ViewAttendence())));
            }
            if (index == 3) {
              //4.item
              Navigator.push(context, MaterialPageRoute(builder: ((context) => ViewReport())));
            }
              if (index == 4) {
              //5.item
            Navigator.push(context, MaterialPageRoute(builder: ((context) => ViewNotice())));
            }
              if (index == 5) {
              //6.item
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
      final currentUser = FirebaseAuth.instance;
    AuthService authService = AuthService();
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: size.height*0.45,
          decoration: BoxDecoration(color: Colors.blue),
        ),
        SafeArea(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
           Container(
            child:  StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("Students")
                                  .where("uid",
                                      isEqualTo: currentUser.currentUser!.uid)
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasData) {
                                  //var data=snapshot.data!.docs[i];
                                  return ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        var data = snapshot.data!.docs[i];
                                        return UserAccountsDrawerHeader(
                                            accountName: Text(
                                              data['Student name'],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            accountEmail: Text(
                                              data['Student id'],
                                            ));
                                      });
                                } else {
                                  return CircularProgressIndicator();
                                }
                              })
           ),
           Expanded(child: GridView.count(crossAxisCount: 2,
           crossAxisSpacing: 20,
           mainAxisSpacing: 20,
           children: [
                _makeDashboarditems("Profile", "assets/pictures/student.png", 0),
                 _makeDashboarditems("Assignment", "assets/pictures/studentassignment2.png", 1),
                _makeDashboarditems("Attendence", "assets/pictures/atten.png", 2),
                _makeDashboarditems("Result", "assets/pictures/result.png", 3),
                _makeDashboarditems("Notice", "assets/pictures/notice.png", 4),
                 _makeDashboarditems("Meeting", "assets/pictures/meeting.png", 5),

             
           ],))
          ],
        ),),
        )

      ]),
    );
  }
}

