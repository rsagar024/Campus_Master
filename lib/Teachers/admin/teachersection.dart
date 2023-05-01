import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/admin/admindashboard.dart';
import 'package:flutter_application_5/Teachers/admin/teacherdata.dart';
import 'package:flutter_application_5/Teachers/registerteacher.dart';

class TeacherSectionScreen extends StatefulWidget {
  const TeacherSectionScreen({Key? key}) : super(key: key);

  @override
  State<TeacherSectionScreen> createState() => _TeacherSectionScreenState();
}

class _TeacherSectionScreenState extends State<TeacherSectionScreen> {
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
              Navigator.push(context, MaterialPageRoute(builder: ((context) => RegisterTeacher())));
            }
            if (index == 1) {
              //2.item
             Navigator.push(context, MaterialPageRoute(builder: ((context) => TeacherData())));
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
      appBar: AppBar(title: Text("Teacher Section"),
        leading: BackButton(onPressed: (() {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => AdminDashBoardScreen())));
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
       
                _makeDashboarditems("Add Teacher", "assets/pictures/addteacher.png", 0),
                 _makeDashboarditems("Teacher Data", "assets/pictures/ap3.png", 1),
            
             
             
           ],))
          ],
        ),),
        )

      ]),
    );
  }
}

