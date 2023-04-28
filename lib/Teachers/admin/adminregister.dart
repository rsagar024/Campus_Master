import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/admin/admindashboard.dart';
import 'package:flutter_application_5/Teachers/admin/adminhelper.dart';
import 'package:flutter_application_5/Teachers/admin/adminlogin.dart';

class AdminRegisterScreen extends StatefulWidget {
  const AdminRegisterScreen({Key? key}) : super(key: key);

  @override
  State<AdminRegisterScreen> createState() => _AdminRegisterScreenState();
}

class _AdminRegisterScreenState extends State<AdminRegisterScreen> {
   TextEditingController email=TextEditingController();
   bool hide=true;
   
   final auth= FirebaseAuth.instance;
  final _fkey = GlobalKey<FormState>();
   TextEditingController admin_id=TextEditingController();
   TextEditingController password=TextEditingController();
  
    AAuthService AauthService=AAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.blue ,
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
                    
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: AauthService.email,
                    decoration:InputDecoration(
                      hintText:"Admin Id",
                      prefixIcon: Icon(Icons.email),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                     validator: (val) => (val!.isEmpty) ? 'Enter Admin id' : null,
                  ),
                  const SizedBox(height: 10),
                    TextFormField(
                    controller: AauthService.password,
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
                //  validateEmail();
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
                  child: TextButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLoginScreen()));
                  }, child: Text("Already have an account?Login"))),
         
                
              
                
              
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
          
  
           Text("Admin Register",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)

      ],))
      ]),
    );
  }
    void proceed() async{
      
      if (AauthService.email!=""&&AauthService.password!="") {
                     AauthService.RegisterUser(context);
                    }
     //FirebaseAuth.instance.signInWithEmailAndPassword(email: "admin@gmail.com", password: "admin123");
     
  }
}

