import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/meeting/historymeet.dart';
import 'package:flutter_application_5/meeting/historymeeting.dart';

import 'meeting_screen.dart';

class HomeMeet2 extends StatefulWidget {
  const HomeMeet2({Key? key}) : super(key: key);

  @override
  State<HomeMeet2> createState() => _HomeMeet2State();
}

class _HomeMeet2State extends State<HomeMeet2> {
  int _page=0;
  onPageChanged(int page){
    setState(() {
      _page=page;
    });

  }
  List<Widget>pages=[
    MeetingScreen(),
     //HistoryMeetingScreen(),
    HistoryMeet(),
    const Text("Contacts"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(46, 46, 46, 1),
      appBar: AppBar(title: Text("Meet & Chat"),
      backgroundColor:Color.fromARGB(46, 46, 46, 1) ,
      centerTitle: true,),
      body:pages[_page] ,
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      onTap: onPageChanged,
      currentIndex: _page,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.comment_bank),label: "Meet&Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.lock_clock),label: "Meetings"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outlined),label: "Contacts"),
              BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: "Settings"),
      ],),
    );
  }
}