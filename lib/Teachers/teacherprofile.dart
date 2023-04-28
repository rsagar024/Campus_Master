

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/dashboard.dart';

import 'homescreen.dart';

class TeacherProfileScreen extends StatefulWidget {
  const TeacherProfileScreen({Key? key}) : super(key: key);

  @override
  State<TeacherProfileScreen> createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {
  final _fkey = GlobalKey<FormState>();
  final teacher_id = TextEditingController();
  final Teacher_name = TextEditingController();
  final _mobController = TextEditingController();
  final _addressController = TextEditingController();
  final _aadharcardnumberController = TextEditingController();
  final firebase=FirebaseFirestore.instance;
  Save() async{
    try{
      await firebase.collection("teachersdata").doc(teacher_id.text).set({
        "teacher_id":teacher_id.text,
        "Name":Teacher_name .text,
        "Mobile No":_mobController.text,
        "Address":_addressController.text,
        "Aadharcard Number":_aadharcardnumberController.text,
      });
    }catch(e){
      print(e);
    }
  }
  Update(){
    try{
      firebase.collection("teachersdata").doc(teacher_id.text).update({
         "Name":Teacher_name .text,
        "Mobile No":_mobController.text,
        "Address":_addressController.text,
        "Aadharcard Number":_aadharcardnumberController.text,

      });
    }catch(e){
      print(e);
    }
  }
  Delete(){
    try{
      firebase.collection("teachersdata").doc(teacher_id.text).delete();
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Profile"),
        leading: BackButton(
          onPressed: (() {
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => DashBoardScreen()));
          }),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        child: Form(
            key: _fkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                TextFormField(
              controller:teacher_id,
               keyboardType: TextInputType.emailAddress,
              decoration:InputDecoration(
                hintText:"Teacher Id",
                //prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            validator: (val) => (val!.isEmpty) ? 'Enter Teacher id' : null,
            ),
              const SizedBox(
                    height: 10,
                  ),
                TextFormField(
              controller:Teacher_name ,
               keyboardType: TextInputType.name,
              decoration:InputDecoration(
                hintText:"Name",
               // prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            validator: (val) => (val!.isEmpty) ? 'Enter Name' : null,
            
            ),
              const SizedBox(
                    height: 10,
                  ),
                TextFormField(
              controller:_mobController,
               keyboardType: TextInputType.phone,
              decoration:InputDecoration(
                hintText:"Mobile No",
              //  prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            validator: (val) => (val!.isEmpty) ? 'Enter Mobile no' : null,
            ),
          
             const SizedBox(
                    height: 10,
                  ),
                TextFormField(
              controller:_aadharcardnumberController,
              keyboardType: TextInputType.number,
              decoration:InputDecoration(
                hintText:"Aadhar Card Number",
               // prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            validator: (val) => (val!.isEmpty) ? 'Enter Aadhar Card Number' : null,
            ),
               const SizedBox(
                    height: 10,
                  ),
                TextFormField(
              controller:_addressController,
                maxLines: 10,
              decoration:InputDecoration(
                hintText:"Address",
              //  prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            validator: (val) => (val!.isEmpty) ? 'Enter Address' : null,
            ),
               const SizedBox(
                    height: 20,
                  ),

                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         ElevatedButton(onPressed: (){
                       Save();
                        teacher_id.clear();
                        Teacher_name .clear();
                        _mobController.clear();
                        _addressController.clear();
                        _aadharcardnumberController.clear();
                      }, child: Text("Save")),
                      ElevatedButton(onPressed: (){
                        Update();
                        teacher_id.clear();
                       Teacher_name .clear();
                        _mobController.clear();
                        _addressController.clear();
                        _aadharcardnumberController.clear();
                      }, child: Text("Update")),
                      ElevatedButton(onPressed: (){
                        Delete();
                        teacher_id.clear();
                        Teacher_name .clear();
                        _mobController.clear();
                        _addressController.clear();
                        _aadharcardnumberController.clear();
                      }, child: Text("Delete"))
                    
                      ],
                     )
                ],
              ),
            )),
      ),
    );
  }
}
