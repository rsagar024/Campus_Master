import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'homeattendence.dart';


class editstudentattendence extends StatefulWidget {
  DocumentSnapshot docid;
  editstudentattendence({required this.docid});

  @override
  _editstudentattendenceState createState() => _editstudentattendenceState(docid: docid);
}

class _editstudentattendenceState extends State<editstudentattendence> {
  DocumentSnapshot docid;
  _editstudentattendenceState({required this.docid});
 TextEditingController studentid = TextEditingController();
 TextEditingController _class= TextEditingController();
 TextEditingController _sub = TextEditingController();
 TextEditingController _na = TextEditingController();
 TextEditingController _ta = TextEditingController();
  
  @override
  void initState() {
   studentid=TextEditingController(text: widget.docid.get('student_id'));
   _class=TextEditingController(text: widget.docid.get('Class'));
   _sub=TextEditingController(text: widget.docid.get('Subject'));
   _na=TextEditingController(text: widget.docid.get('No_of_classattend'));
   _ta=TextEditingController(text: widget.docid.get('Total_no_of_class'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => AttendenceHome()));
            },
            child: Text(
              "Back",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 251, 251, 251),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'student_id':studentid.text,
                 "Class":_class.text,
                 "Subject":_sub.text,
                 "No_of_classattend":_na.text,
                 "Total_no_of_class":_ta.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => AttendenceHome()));
              });
            },
            child: Text(
              "Save",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 251, 251, 251),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => AttendenceHome()));
              });
            },
            child: Text(
              "Delete",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 251, 251, 251),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
               Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: studentid,
                  decoration: InputDecoration(
                    hintText: 'Student id',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: _class,
                  decoration: InputDecoration(
                    hintText: 'Class',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: _sub,
                  maxLines: null,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Subject',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: _na,
                  maxLines: null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'No of class attend',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: _ta,
                  maxLines: null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Total no of class',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}