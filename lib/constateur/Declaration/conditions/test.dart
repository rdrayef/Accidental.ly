import 'package:accidenyally/constateur/Declaration/conditions/tt2.dart';
import 'package:accidenyally/constateur/Declaration/T%C3%A9moins/temoin.dart';
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
          title: Text("Circonstances Accident",
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
          Container(
            margin: EdgeInsets.only(left: 250),
            child: SizedBox(
                height: 50,
                width: 120,
                child: RaisedButton(
                  color: bluecolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Temoins()));
                  },
                  child: Icon(
                    Icons.trending_flat_rounded,
                    color: Colors.white,
                    size: 45,
                  ),
                )),
          ),
        ],
      ), //SizedBox
      //Scaffold
    )); //MaterialApp
  }
}
