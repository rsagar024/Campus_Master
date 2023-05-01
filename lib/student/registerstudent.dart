import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/admin/studentsection.dart';
import 'package:flutter_application_5/student/studenthelper.dart';

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({Key? key}) : super(key: key);

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
   bool hide=true;
   TextEditingController email=TextEditingController();
  
  final _fkey = GlobalKey<FormState>();
   TextEditingController student_id=TextEditingController();
   TextEditingController spassword=TextEditingController();
   TextEditingController student_name=TextEditingController();
   SAuthService sauthService=SAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF3b5999).withOpacity(.85) ,
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 200),
          width: double.infinity,
          height: 800,
         decoration: BoxDecoration(color: Colors.white,
        ),
         child:  Form(
              key: _fkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children:[
                   SizedBox(height:30),
                     TextFormField(
                      controller: sauthService.student_name,
                    decoration:InputDecoration(
                      hintText:"Name",
                      prefixIcon: Icon(Icons.person),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                     validator: (val) => (val!.isEmpty) ? 'Enter Name' : null,
                  ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: sauthService.email,
                      keyboardType: TextInputType.emailAddress,
                    decoration:InputDecoration(
                      hintText:"Student Id",
                      prefixIcon: Icon(Icons.email),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  validator: (val) {
                      if(!EmailValidator.validate(val!)){
                        return 'Please enter a valid email';
                      }
  }),
                  const SizedBox(height: 10),
                    TextFormField(
                     controller: sauthService.spassword,
                      obscureText: hide,
                    decoration:InputDecoration(
                      hintText:"Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          hide=!hide;
                        });
              
                      },icon: hide?Icon(Icons.visibility_off):Icon(Icons.visibility),),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                     validator: (val) => (val!.isEmpty) ? 'Enter Password' : null,
                  ),
                  
                   const SizedBox(
                height: 20,
              ),
              ElevatedButton(
              onPressed: (){
                 if (_fkey.currentState!.validate()) {
                     proceed();
                    }
              }, child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20),
              minimumSize: const Size(double.infinity,50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
           ),),
               const SizedBox(
                height: 10,
              ),
              
                 Align(
                    alignment: Alignment.center,
                    child:  ElevatedButton(
              onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: ((context) => StudentSectionScreen())));
              }, child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20),
              minimumSize: const Size(double.infinity,50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
           ),), ),
                
              
                  ]
                ),
              ),
            ),
          ),
        ),
       
      Positioned(
        top: 70,
        left: 50,
        right: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
  
           Text("Student Registration",style: TextStyle(color: Colors.yellow[700],fontWeight: FontWeight.bold,fontSize: 40),)

      ],))
      ]),
    );
  }
  
  void proceed() {
      if (sauthService.email!=""&&sauthService.spassword!="") {
                     sauthService.RegisterUser(context);
                    }
  }
}