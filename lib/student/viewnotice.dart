import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/student/studentdashboard.dart';


class ViewNotice extends StatefulWidget {
  const ViewNotice({Key? key}) : super(key: key);

  @override
  State<ViewNotice> createState() => _ViewNoticeState();
}

class _ViewNoticeState extends State<ViewNotice> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('notice').snapshots();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.0), child: AppBar(
        leading: InkWell(
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: ((context) => StudentDashBoardScreen())));
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text("Notice"),
      ),),
      body:StreamBuilder(stream: _usersStream,builder:(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                   /* Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                           editnote(docid: snapshot.data!.docs[index]),
                      ),
                    );*/
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: 3,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['Date'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data!.docChanges[index].doc['Notice'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
          
      },)
    );
  }
}