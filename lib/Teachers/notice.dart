//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/noticedashboard.dart';

import 'homescreen.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  String title='Date Picker';
  DateTime _date= DateTime.now();
  Future <Null>_selectDate(BuildContext context) async{
    DateTime? _datePicker=await showDatePicker(context: context, initialDate: _date, firstDate: DateTime(1975), lastDate: DateTime(2050));

    if(_datePicker!=null && _datePicker!=_date){
      setState(() {
        _date=_datePicker;
      });
    }
  }
  final int maxLines = 10;
  TextEditingController notice=TextEditingController();
  TextEditingController noticedate=TextEditingController();
   final firebase=FirebaseFirestore.instance;
  AddNotice()async{
    try{
      await firebase.collection("notice").doc(notice.text).set({
         "Date":noticedate.text,
        "Notice":notice.text,
      });

    }catch(e){
      print(e);
    }
  }
  DeleteNotice()async{
    try{
       firebase.collection("notice").doc(notice.text).delete();
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
              context, MaterialPageRoute(builder: (_) => NoticeDashBoardScreen()));
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
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: TextFormField(
                controller: noticedate,
               
             
                decoration: InputDecoration(hintText: "DD/MM/YYYY",
                icon: Icon(Icons.calendar_month)
               )
                
        ),
        
             ),
             const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
            children: [
                TextField(
                  controller: notice,
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
                   notice.clear();
                   noticedate.clear();
                               
                }, child: Text("Post")),
                const SizedBox(width: 20,),
             
                ElevatedButton(onPressed: (){
                   DeleteNotice();
                   notice.clear();
                     noticedate.clear();
                               
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
