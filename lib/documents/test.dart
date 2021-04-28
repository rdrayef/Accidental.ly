import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../colors.dart';

class Testscard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
        child: new StreamBuilder(
            stream: StreamGetuserdoc(context),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballPulse,
                      color: Colors.orange,
                    ),
                  ),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return getdecors(
                      snapshot.data.documents[index]['type'],
                      size.height * 0.09,
                      size.width * 0.95,
                      snapshot.data.documents[index]['nom_fichier'],
                      snapshot.data.documents[index]['fichier'],
                    );
                  });
            }));
  }
}

Widget getdecors(
    String type, double sheight, double swidth, String text, String fichier) {
  Color colorval;
  Color stcolor;
  Color encolor;
  Image image;
  Color shcolor;
  //Image image;
  switch (type) {
    case 'pdf':
      colorval = rougecolor;
      image = Image.asset("assets/images/pdf.png");
      stcolor = rougecolor;
      encolor = Colors.pink;
      shcolor = Colors.red;
      break;
    case 'image':
      colorval = bluecolor;
      image = Image.asset("assets/images/image.png");
      stcolor = Colors.yellow[900];
      encolor = Colors.yellow[700];
      shcolor = Colors.orange;
      break;
  }
  return Container(
    margin: EdgeInsets.only(bottom: sheight * 0.07),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.only(left: 0),
            child: Row(
              children: [
                IconButton(
                  icon: image,
                  onPressed: () {},
                  iconSize: 18,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 28,
                      ),
                      onPressed: () {
                        if (type == 'pdf') {
                          print(type + "============>" + fichier);
                        } else if (type == 'image') {
                          print(type + "============>" + fichier);
                          return Scaffold(
                            body: Image.network(fichier),
                          );
                        } else {
                          return SnackBar(content: Text('format insupporté'));
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            height: sheight,
            width: swidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: colorval,
                gradient: LinearGradient(
                    colors: [stcolor, encolor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                      color: shcolor, blurRadius: 2, offset: Offset(0, 6)),
                ]),
          ),
        ),
      ],
    ),
  );
}

Stream<QuerySnapshot> StreamGetuserdoc(BuildContext context) async* {
  final uid = (await FirebaseAuth.instance.currentUser()).uid;
  yield* Firestore.instance
      .collection('utilisateurs')
      .document(uid)
      .collection('pieces_jointes')
      .snapshots();
}

Widget Readimage(String file) {
  return Image.network(file);
}
