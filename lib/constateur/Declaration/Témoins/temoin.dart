import 'package:accidenyally/constateur/Declaration/T%C3%A9moins/ajouter_tmn.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../colors.dart';

class Temoins extends StatefulWidget {
  String docid;
  Temoins({Key key, @required this.docid}) : super(key: key);
  @override
  _TemoinsState createState() => _TemoinsState(docid: docid);
}

class _TemoinsState extends State<Temoins> {
  String docid;
  _TemoinsState({this.docid});
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
      print(docid);
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
                        color: bluecolor,
                        fontSize: 23,
                        fontWeight: FontWeight.w600)),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.person_add_alt_1_rounded,
                    size: 30,
                    color: rougggecolor,
                  ),
                  onPressed: () {},
                )),
            body: Column(children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Row(
                  children: [
                    AutoSizeText(
                      "Y a-t-il des témoins ?",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.09,
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
              Container(
                child: Expanded(
                    child: new StreamBuilder(
                        stream: StreamGetuserdoc(context),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                                return tmns(
                                    snapshot.data.documents[index]['prenom'],
                                    snapshot.data.documents[index]['nom'],
                                    snapshot.data.documents[index]['genre']);
                              });
                        })),
              )
              // ],
              //SizedBox
              //Scaffold
            ])));
  }

  Widget BTN(bool v) {
    if (v == true) {
      return RaisedButton(
          color: bluecolor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Ajoutemoins(docid: docid)));
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
                      left: MediaQuery.of(context).size.width * 0.33),
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

  Stream<QuerySnapshot> StreamGetuserdoc(BuildContext context) async* {
    yield* Firestore.instance
        .collection('utilisateurs')
        .document(docid)
        .collection('constat')
        .document('1H4qvuGXPB1pbooVgBKS')
        .collection('temoins')
        .snapshots();
  }

  Widget tmns(String prenom, String nom, String g) {
    Color colorval;
    Color shcolor;
    //Image image;
    switch (g) {
      case 'f':
        colorval = rougecolor;
        shcolor = rougecolor;

        break;
      case 'm':
        colorval = bluecolor;
        shcolor = griscolor;
        break;
    }
    return Container(
      margin: EdgeInsets.only(left: 9, right: 9, top: 20),
      height: MediaQuery.of(context).size.height * 0.065,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 16,
            ),
            width: 10,
            height: 10,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {},
              backgroundColor: colorval,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 18),
            child: Text(
              prenom,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2),
            child: Text(
              nom,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: shcolor, blurRadius: 2, offset: Offset(0, 2)),
          ]),
    );
  }
}
