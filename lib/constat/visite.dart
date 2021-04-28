import 'package:accidenyally/accueil/menu.dart/menu.dart';
import 'package:accidenyally/constat/page_constat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class Boddy extends StatefulWidget {
  @override
  _BoddyState createState() => _BoddyState();
}

class _BoddyState extends State<Boddy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Constat N°xxxx",
            style: TextStyle(color: bluecolor, fontSize: 26)),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: bluecolor,
              size: 31,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Accueil()),
              );
            }),
      ),
      body: Contenu(),
    );
  }
}

class Contenu extends StatefulWidget {
  @override
  _ContenuState createState() => _ContenuState();
}

class _ContenuState extends State<Contenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 75.0, left: 5),
        child: Column(
          children: [
            Row(
              children: [Container()],
            )
          ],
        ),
      ),
    );
  }
}
