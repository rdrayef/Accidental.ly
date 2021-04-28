import 'package:accidenyally/accueil/menu.dart/menu.dart';
import 'package:accidenyally/constat/sup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../colors.dart';

class Constat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: StreamGetuserdoc(context),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: LoadingIndicator(
                indicatorType: Indicator.ballPulse,
                color: Colors.orange,
              ),
            );
          }
          int total = snapshot.data.documents.length;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: new AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text("Constat",
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
              bottom: PreferredSize(
                  child: Text(
                    "Vous avez déclaré $total constats ",
                    style: TextStyle(
                        fontSize: 18,
                        color: griscolor,
                        fontWeight: FontWeight.bold),
                  ),
                  preferredSize: Size.fromHeight(50)),
            ),
            body: Getcons(),
          );
        });
  }
}

Stream<QuerySnapshot> StreamGetuserdoc(BuildContext context) async* {
  final uid = (await FirebaseAuth.instance.currentUser()).uid;
  yield* Firestore.instance
      .collection('utilisateurs')
      .document(uid)
      .collection('constat')
      .snapshots();
}
