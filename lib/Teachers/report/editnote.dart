import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/Teachers/report/home.dart';


class editnote extends StatefulWidget {
  DocumentSnapshot docid;
  editnote({required this.docid});

  @override
  _editnoteState createState() => _editnoteState(docid: docid);
}

class _editnoteState extends State<editnote> {
  DocumentSnapshot docid;
  _editnoteState({required this.docid});
  TextEditingController studentid=TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController course = TextEditingController();
   TextEditingController subject = TextEditingController();
  TextEditingController exam = TextEditingController();
  TextEditingController marks = TextEditingController();
   TextEditingController tmarks = TextEditingController();

  @override
  void initState() {
    studentid = TextEditingController(text: widget.docid.get('student_id'));
    name = TextEditingController(text: widget.docid.get('name'));
    course = TextEditingController(text: widget.docid.get('course'));
     course = TextEditingController(text: widget.docid.get('subject'));
    exam = TextEditingController(text: widget.docid.get('exam'));
    marks= TextEditingController(text: widget.docid.get('marks'));
    tmarks = TextEditingController(text: widget.docid.get('total_marks'));

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
                  context, MaterialPageRoute(builder: (_) => Home()));
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
                'name': name.text,
                'course': course.text,
                 'subject': subject.text,
                'exam': exam.text,
                'marks': marks.text,
                 'total_marks': tmarks.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text(
              "save",
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
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text(
              "delete",
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
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'name',
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
                  controller: course,
                  maxLines: null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Course',
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
                  controller: subject,
                  maxLines: null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'subject',
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
                  controller: exam,
                  maxLines: null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Exam',
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
                  controller: marks,
                  maxLines: null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Marks',
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
                  controller: tmarks,
                  maxLines: null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'total marks',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /*MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => reportt(
                        docid: docid,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Make Report",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 251, 251, 251),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}