import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/teacherhelper.dart';
import 'package:flutter_application_5/Teachers/teacherlogin.dart';


import 'admin/teachersection.dart';

class RegisterTeacher extends StatefulWidget {
  const RegisterTeacher({Key? key}) : super(key: key);

  @override
  State<RegisterTeacher> createState() => _RegisterTeacherState();
}

class _RegisterTeacherState extends State<RegisterTeacher> {
   TextEditingController email=TextEditingController();
   bool hide=true;
   
  final _fkey = GlobalKey<FormState>();
   TextEditingController teacher_id=TextEditingController();
   TextEditingController password=TextEditingController();
   TextEditingController Teacher_name=TextEditingController();
    AuthService authService=AuthService();

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
                      controller: authService.Teacher_name,
                    decoration:InputDecoration(
                      hintText:"Name",
                      prefixIcon: Icon(Icons.person),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                     validator: (val) => (val!.isEmpty) ? 'Enter Name' : null,
                  ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: authService.email,
                      keyboardType: TextInputType.emailAddress,
                    decoration:InputDecoration(
                      hintText:"Teacher Id",
                      prefixIcon: Icon(Icons.email),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                     validator: (val) {
                      if(!EmailValidator.validate(val!)){
                        return 'Please enter a valid email';
                      }
                     }
                  ),
                  const SizedBox(height: 10),
                    TextFormField(
                     controller: authService.password,
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
           SizedBox(height: 10,),
            Align(
                    alignment: Alignment.center,
                    child:  ElevatedButton(
              onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: ((context) => TeacherSectionScreen())));
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
        /*Container(
         padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 200,left: 50,right: 50),
          width:double.infinity,
          height:  500,
           
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [BoxShadow(
              color: Colors.black,
              spreadRadius: 0.1,
              blurRadius: 5,
            )]
          ),
          child: Form(
              key: _fkey,
            child: SingleChildScrollView(
              child: Column(
                children:[
                 //SizedBox(height:20),
                   TextFormField(
                  //  controller: authService.Teacher_name,
                  decoration:InputDecoration(
                    hintText:"Name",
                    prefixIcon: Icon(Icons.person),
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                   validator: (val) => (val!.isEmpty) ? 'Enter Name' : null,
                ),
                  const SizedBox(height: 10),
                  TextFormField(
                    //controller: authService.email,
                  decoration:InputDecoration(
                    hintText:"Teacher Id",
                    prefixIcon: Icon(Icons.email),
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                   validator: (val) => (val!.isEmpty) ? 'Enter Teacher id' : null,
                ),
                const SizedBox(height: 10),
                  TextFormField(
                   // controller: authService.password,
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
                   // proceed();
                  }
            }, child: Text("Sign-Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),style: ElevatedButton.styleFrom(
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
                  child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  }, child: Text("Already have a account?Login"))),
              
            
                ]
              ),
            ),
          ),
        ),*/
      Positioned(
        top: 70,
        left: 50,
        right: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
  
           Text("Teacher Registration",style: TextStyle(color: Colors.yellow[700],fontWeight: FontWeight.bold,fontSize: 40),)

      ],))
      ]),
    );
  }
  
  void proceed() {
      if (authService.email!=""&&authService.password!="") {
                     authService.RegisterUser(context);
                    }
  }
}