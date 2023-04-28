
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/student/studentdashboard.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  final _fkey = GlobalKey<FormState>();
  final  student_id = TextEditingController();
  final  student_name = TextEditingController();
  final  student_course = TextEditingController();
  final _mobController = TextEditingController();
  final _addressController = TextEditingController();
  final _aadharcardnumberController = TextEditingController();
  final firebase=FirebaseFirestore.instance;
  Save() async{
    try{
      await firebase.collection("student_data").doc(student_id.text).set({
        "Student id":student_id.text,
        "Name": student_name.text,
        "Course":student_course.text,
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
      firebase.collection("student_data").doc(student_id.text).update({
         "Name": student_name .text,
          "Course":student_course.text,
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
      firebase.collection("student_data").doc(student_id.text).delete();
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Profile"),
        leading: BackButton(
          onPressed: (() {
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => StudentDashBoardScreen()));
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
              controller:student_id,
              decoration:InputDecoration(
                hintText:"Student Id",
                //prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            validator: (val) => (val!.isEmpty) ? 'Enter Student id' : null,
             keyboardType: TextInputType.emailAddress,
            ),
              const SizedBox(
                    height: 10,
                  ),
                TextFormField(
              controller: student_name,
              decoration:InputDecoration(
                hintText:"Name",
               // prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            validator: (val) => (val!.isEmpty) ? 'Enter Name' : null,
             keyboardType: TextInputType.name,
            ),
            const SizedBox(
                    height: 10,
                  ),
                TextFormField(
              controller: student_course,
              decoration:InputDecoration(
                hintText:"Course",
               // prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            validator: (val) => (val!.isEmpty) ? 'Enter Course' : null,
            ),
              const SizedBox(
                    height: 10,
                  ),
                TextFormField(
              controller:_mobController,
              decoration:InputDecoration(
                hintText:"Mobile No",
              //  prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            validator: (val) => (val!.isEmpty) ? 'Enter Mobile no' : null,
             keyboardType: TextInputType.phone,
            ),
          
             const SizedBox(
                    height: 10,
                  ),
                TextFormField(
              controller:_aadharcardnumberController,
              decoration:InputDecoration(
                hintText:"Aadhar Card Number",
               // prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            validator: (val) => (val!.isEmpty) ? 'Enter Aadhar Card Number' : null,
             keyboardType: TextInputType.number,
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
                        student_id.clear();
                        student_name .clear();
                        student_course.clear();
                        _mobController.clear();
                        _addressController.clear();
                        _aadharcardnumberController.clear();
                      }, child: Text("Save")),
                      ElevatedButton(onPressed: (){
                        Update();
                        student_id.clear();
                       student_name .clear();
                       student_course.clear();
                        _mobController.clear();
                        _addressController.clear();
                        _aadharcardnumberController.clear();
                      }, child: Text("Update")),
                      ElevatedButton(onPressed: (){
                        Delete();
                       student_id.clear();
                        student_name .clear();
                        student_course.clear();
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
