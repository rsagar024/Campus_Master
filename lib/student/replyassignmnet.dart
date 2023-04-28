import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/student/viewassignment.dart';

class ReplyAssignment extends StatefulWidget {
  const ReplyAssignment({Key? key}) : super(key: key);

  @override
  State<ReplyAssignment> createState() => _ReplyAssignmentState();
}

class _ReplyAssignmentState extends State<ReplyAssignment> {
   PlatformFile? pickedFile;
    FirebaseFirestore firestoreRef=FirebaseFirestore.instance;
   bool _isLoading=false;
   double progress=0.0;
  UploadTask? uploadTask;
  Future selectfile() async{
    final result=await FilePicker.platform.pickFiles();
    if(result==null) return;

    setState(() {
      pickedFile=result.files.first;
    });
  }
   Future uploadfile() async{
   final path='files/${pickedFile!.name}';
   final file=File(pickedFile!.path!);

   final ref=FirebaseStorage.instance.ref().child(path);
  setState(() {
    uploadTask= ref.putFile(file);
  });
   final snapshot=await uploadTask!.whenComplete((){});
   await uploadTask!.whenComplete(() async{
    final uploadPath=await snapshot.ref.getDownloadURL();
    if(uploadPath.isNotEmpty){
      firestoreRef.collection('files').doc().set({
         "Name":student_name.text,
        "Student id":student_id.text,
        "Subject":sub.text,
        "file":uploadPath

      }).then((value) => _showMessage("Assignmnet Submitted Successfully"));
    }else{
        _showMessage("Something is wrong while uploading");
    }
   });
   
  

  
  
  }
  _showMessage(String msg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),duration: const Duration(seconds: 3),));
  }
    var sub=new TextEditingController();
   var student_name=new TextEditingController();
    var student_id=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reply"),
      leading: BackButton(
        onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Assignment2())));
        },
      ),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: student_name,
                decoration: InputDecoration(
                    labelText: "Name", border: OutlineInputBorder()),
            ),
          ),
              SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: student_id,
                decoration: InputDecoration(
                    labelText: "Student id", border: OutlineInputBorder()),
            ),
          ),
            
               SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: sub,
                decoration: InputDecoration(
                    labelText: "Subject", border: OutlineInputBorder()),
            ),
          ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             ElevatedButton(onPressed: (){
              selectfile();
             }, child: Text("Select File")),
              SizedBox(width: 20,),
           ElevatedButton(onPressed: (){
            uploadfile();
           
           }, child: Text("Upload file")),
      
           ],
         ),
        
           
           // (file==null)?Container(): Image.file(File(file!.path.toString()),width: 100,height: 100,),
          
          ]),
        ),
      ),
    );
    
  }}