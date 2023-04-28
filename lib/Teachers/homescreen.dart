import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Teachers/notice.dart';
import 'package:flutter_application_5/Teachers/provideassignment.dart';
import 'package:flutter_application_5/Teachers/teacherhelper.dart';
import 'package:flutter_application_5/Teachers/teacherprofile.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final currentUser = FirebaseAuth.instance;
    AuthService authService = AuthService();
   // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
//height: size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/pictures/bg2.webp'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
              //height: 64,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                 StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("Teachers")
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
                                              data['Teacher name'],
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            accountEmail: Text(
                                              data['Teacher id'],
                                            ));
                                      });
                                } else {
                                  return CircularProgressIndicator();
                                }
                              })
                            ],
                          )
                        ],
                      ),
                    ),
              
                    Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        crossAxisCount: 2,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  ElevatedButton(onPressed: (){
                                    Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => TeacherProfileScreen()));
              
                                }, child:  Image.asset('assets/pictures/ap3.png', height:100,),style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),),
                                SizedBox(height: 4,),
                                Text('Profile',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                
                              ],
                            ),
                          ),
              
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 ElevatedButton(onPressed: (){
                                 Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) =>ProvideAssignment()));
              
                                }, child:  Image.asset('assets/pictures/studentassignment.png', height: 100,),style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),),
                                 SizedBox(height: 4,),
                               
                                Text('Assignment',
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                            
                              ],
                            ),
                          ),
              
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                    ElevatedButton(onPressed: (){
                                    /*Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => ViewAttendence()));*/
              
                                }, child:  Image.asset('assets/pictures/ap0.png', height: 100,),style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),),
                                SizedBox(height: 4,),
                               
                                Text('Student Attendance',
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                                
                              ],
                            ),
                          ),
              
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    /*Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Home()));*/
                                  },
                                  child: Image.asset(
                                    'assets/pictures/result.png',
                                    height: 100,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                  
                                ),
                                  SizedBox(height: 6,),
                                Text('Student Result',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                
                              ],
                            ),
                          ),
              
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                     ElevatedButton(
                                  onPressed: () {
                                  Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => NoticeScreen()));
                                  },
                                  child: Image.asset(
                                    'assets/pictures/notice.png',
                                    height: 100,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                ),
                                  SizedBox(height: 6,),
                                Text('Notice',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                
                              ],
                            ),
                          ),
              
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 ElevatedButton(
                                  onPressed: () {
                                    /* Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) =>Assignment2()));*/
                                  },
                                  child: Image.asset(
                                    'assets/pictures/meeting.png',
                                    height: 100,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                  
                                ),
                                  SizedBox(height: 6,),
                                Text('Meeting',
                                    style: TextStyle(fontWeight: FontWeight.bold))
              
                               
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}