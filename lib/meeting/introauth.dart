import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroAuthScreen extends StatefulWidget {
  const IntroAuthScreen({Key? key}) : super(key: key);

  @override
  State<IntroAuthScreen> createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages:[
        PageViewModel(
          title: "WELCoME",
          body: "WElcome to Meeting,the best video confrencing app",
          image: Center(child: Image.asset("assets/pictures/meeting.png"),
          ),
          decoration: const PageDecoration(
    pageColor: Colors.blue,
  ),
        )

      ]
    );
  }
}