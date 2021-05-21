import 'package:accidenyally/constateur/Declaration/conditions/tt2.dart';
import 'package:accidenyally/constateur/Declaration/T%C3%A9moins/temoin.dart';
import 'package:accidenyally/constateur/Declaration/point_impact.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
          Container(
            margin: EdgeInsets.only(bottom: 15, top: 5),
            child: AutoSizeText(
              'Cocher chacune des cases utilies',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
                color: rougggecolor,
              ),
            ),
          ),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder:
                                (context) => /*Temoins()*/ Pointdimpacte()));
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
