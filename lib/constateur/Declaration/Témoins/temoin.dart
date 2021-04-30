import 'package:accidenyally/constateur/Declaration/T%C3%A9moins/ajouter_tmn.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../colors.dart';

class Temoins extends StatefulWidget {
  @override
  _TemoinsState createState() => _TemoinsState();
}

class _TemoinsState extends State<Temoins> {
  bool v1;
  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
        v1 = isSwitched;
        print(v1);
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
        v1 = isSwitched;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Témoins-dégats",
              style: TextStyle(
                  color: bluecolor, fontSize: 23, fontWeight: FontWeight.w600)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.person,
              size: 30,
              color: rougggecolor,
            ),
            onPressed: () {},
          )),
      body: Column(
        children: [
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Row(
              children: [
                AutoSizeText(
                  "Y a-t-il des témoins ?",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
                Switch(
                  onChanged: toggleSwitch,
                  value: isSwitched,
                  activeColor: Colors.grey[100],
                  activeTrackColor: bluecolor,
                  inactiveThumbColor: Colors.grey[100],
                  inactiveTrackColor: rougggecolor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            child: BTN(v1),
          ),
        ],
      ), //SizedBox
      //Scaffold
    ));
  }

  Widget BTN(bool v) {
    if (v == true) {
      return RaisedButton(
          color: bluecolor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Ajoutemoins()));
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.065,
            width: double.maxFinite,
            child: Row(
              children: [
                Container(
                  child: AutoSizeText(
                    "Nouveau Témoin",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.46),
                  child: Icon(
                    Icons.person_add_alt_1_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ));
    }
    return null;
  }
}
