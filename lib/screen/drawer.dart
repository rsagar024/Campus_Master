import 'package:flutter/material.dart';
import 'package:flutter_application_5/Teachers/admin/adminlogin.dart';
import 'package:flutter_application_5/Teachers/teacherlogin.dart';
import 'package:flutter_application_5/student/studentlogin.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Image.asset('assets/images/collegelogo.png', width: 140),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 530,
              child: Column(
                children: [
                  const SizedBox(height: 55),
                  // ListTile(
                  //   title: Text('Student'),
                  //   onTap: (){},
                  // ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentLoginScreen()));
                    },
                    child: Padding(padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(child: Icon(Icons.person)),
                          Expanded(flex: 3, child: Text('Student',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: Padding(padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(child: Icon(Icons.person)),
                          Expanded(flex: 3, child: Text('Teacher',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLoginScreen()));
                    },
                    child: Padding(padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(child: Icon(Icons.person_outline)),
                          Expanded(flex: 3, child: Text('Admin',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
