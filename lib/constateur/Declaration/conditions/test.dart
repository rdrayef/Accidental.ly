import 'package:accidenyally/constateur/Declaration/conditions/conditions.dart';
import 'package:flutter/material.dart';

import '../../../colors.dart';

// importing material design libraryy

class Questions extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Questions> {
// App widget tree
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Spatio-temporel",
              style: TextStyle(
                  color: bluecolor, fontSize: 23, fontWeight: FontWeight.w600)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.person_pin_circle_rounded,
              size: 30,
              color: rougggecolor,
            ),
            onPressed: () {},
          )),
      body: Column(
        children: [
          Container(child: Conditions()),
        ],
      ), //SizedBox
      //Scaffold
    )); //MaterialApp
  }
}
