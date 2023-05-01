import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/Teachers/teacherhelper.dart';

import '../resetpassword.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hide=true;
 AuthService authService=AuthService();
  final _fkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: 1000,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/pictures/project.jpg"),
                  fit: BoxFit.fill)
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90,left: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: TextSpan(text: "Welcome to",
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.yellow[700],letterSpacing: 2),
                    children: [
                      TextSpan(text: " Arka Jain University,",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.yellow[700]))
                    ]
                    
                    ),),
                    SizedBox(height: 5,),
                    Text("Signin to continue",style: TextStyle(letterSpacing: 1,color: Colors.white),)
                    
                  ],
                  
                ),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 190),
          child: Container(
              height: 380,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5)
                  ]),
                  child:Form(
      key: _fkey,
      child: SingleChildScrollView(
          child: Column(
          children: [
            Text("Sign-In",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),
            const SizedBox(height: 10),
            TextFormField(
              controller: authService.email,
              decoration:InputDecoration(
                hintText:"Teacher Id",
                prefixIcon: Icon(Icons.email),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            validator: (val) => (val!.isEmpty) ? 'Enter Teacher id' : null,
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
              height: 10,
            ),
            
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
                  }, child: Text("Forgot Password?"))),
              

            

           
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
            onPressed: (){
                 if (_fkey.currentState!.validate()) {
                    proceed();
                  
                  }
            }, child: Text("Sign-In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            minimumSize: const Size(double.infinity,50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
           ),),
            const SizedBox(
              height: 10,
            ),
                 const SizedBox(
              height: 10,
            ),
             
            
            
              

            /*Row(
              mainAxisAlignment: MainAxisAlignment.center, 
             children: [
              Text("Don't have an account?"),
              //const SizedBox(height: 10,),
              TextButton(onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: ((context) => RegisterScreen())));
              }, child: Text("Sign-Up Now",style: TextStyle(decoration: TextDecoration.underline),)),
              
              
             ],
            ),*/
            
          ],
          ),
      ),
    )
            
          ),
        )
        ],
      ),
    );
  }
  
  void proceed() {
       if (authService.email!=""&&authService.password!="") {
                  authService.LoginUser(context); 
                  }
  }
}