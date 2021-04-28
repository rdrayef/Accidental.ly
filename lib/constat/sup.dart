import 'package:accidenyally/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Getcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
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
          if (!snapshot.hasData) {
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
              itemBuilder: (context, index) => getcard(
                  snapshot.data.documents[index]['num'],
                  snapshot.data.documents[index]['adresse'],
                  snapshot.data.documents[index]['etat_si'],
                  snapshot.data.documents[index]['date'],
                  snapshot.data.documents[index]['heure'],
                  snapshot.data.documents[index]['img']));
        });
  }
}

Widget getcard(
    String numer, String adr, String etat, String dt, String hr, String img) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(top: 3.0, left: 5),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(top: 11),
          child: Row(
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text("Consstat N°$numer",
                          style: TextStyle(
                              color: bluecolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 5),
                      child: Text(
                        adr,
                        style: TextStyle(color: bluecolor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 2),
                      child: Text(etat, style: TextStyle(color: blufanccolor)),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 20, left: 2),
                            alignment: FractionalOffset(0.1, 12),
                            child: Text(dt, style: TextStyle(color: griscolor)),
                          ),
                          Container(
                              alignment: FractionalOffset(0.1, 12),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 20),
                                    child: Text(hr,
                                        style: TextStyle(color: griscolor)),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: IconButton(
                                            icon: Image.asset(
                                                "assets/icons/pen_modifier.png"),
                                            /* onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Boddy()));
                                            },*/
                                            onPressed: () {},
                                          ),
                                        ),
                                        Container(
                                          child: IconButton(
                                            icon: Image.asset(
                                                "assets/icons/supprimer.png"),
                                            onPressed: () {},
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //photo du constat
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: NetworkImage(img)),
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loader.gif',
                  image: img,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Stream<QuerySnapshot> StreamGetuserdoc(BuildContext context) async* {
  final uid = (await FirebaseAuth.instance.currentUser()).uid;
  yield* Firestore.instance
      .collection('utilisateurs')
      .document(uid)
      .collection('constat')
      .snapshots();
}
