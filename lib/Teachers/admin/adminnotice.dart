//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/admin/admindashboard.dart';
import 'package:flutter_application_5/Teachers/dashboard.dart';
//import 'package:flutter_application_4/teacher.dart/teacherdashboard.dart';



class NoticeScreen2 extends StatefulWidget {
  const NoticeScreen2({Key? key}) : super(key: key);

  @override
  State<NoticeScreen2> createState() => _NoticeScreen2State();
}

class _NoticeScreen2State extends State<NoticeScreen2> {
 
  final int maxLines = 10;
  TextEditingController notice2=TextEditingController();
 // TextEditingController noticedate=TextEditingController();
   final firebase=FirebaseFirestore.instance;
  AddNotice()async{
    try{
      await firebase.collection("adminnotice").doc(notice2.text).set({
       //  "Date":noticedate.text,
        "Notice2":notice2.text,
      });

    }catch(e){
      print(e);
    }
  }
  DeleteNotice()async{
    try{
       firebase.collection("adminnotice").doc(notice2.text).delete();
    }catch(e){
      print(e);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notice"),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => AdminDashBoardScreen()));
          },
          child: Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
         child: Column(
           children: [
           
             const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
            children: [
                TextField(
                  controller: notice2,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                   
                  ),
                ),
      
                 const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  AddNotice();
                   notice2.clear();
                  
                               
                }, child: Text("Post")),
                const SizedBox(width: 20,),
             
                ElevatedButton(onPressed: (){
                   DeleteNotice();
                   notice2.clear();
                   
                               
                }, child: Text("Delete")),
                  ],
                )
            
           ],
         ),
              ),
         
        
          ]),
          ),
      ));
  }
}
