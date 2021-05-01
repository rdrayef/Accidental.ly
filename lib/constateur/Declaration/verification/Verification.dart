import 'package:accidenyally/colors.dart';
import 'package:accidenyally/constateur/Declaration/Information_pr/information_pr.dart';
import 'package:accidenyally/constateur/Declaration/T%C3%A9moins/ajouter_tmn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tst extends StatefulWidget {
  @override
  _TstState createState() => _TstState();
}

class _TstState extends State<Tst> {
  TextEditingController _verfc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double devwidth(BuildContext context) => MediaQuery.of(context).size.width;
    double devheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //     margin: EdgeInsets.only(left: devwidth(context) / 2),
                height: devwidth(context) / 1.7,
                width: devwidth(context) * 2,
                decoration: BoxDecoration(
                  color: bluecolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  ),
                ),
                child: Image.asset(
                  'assets/images/Composant 7 – 1.png',
                  height: 130,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: devheight(context) / 12),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 120),
                      child: Text("Code Conducteur",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 135, top: 12),
                      child: Text(
                          "Entrer le code de du conducteur\n pour déclarer une constat",
                          style: TextStyle(
                            color: griscolor,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: devheight(context) / 12),
                      height: 62,
                      width: 300,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: SingleChildScrollView(
                            child: TextField(
                              controller: _verfc,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Code",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        boxShadow: [
                          BoxShadow(
                            color: bluecolor,
                            spreadRadius: 3,
                            blurRadius: 0,
                            offset: Offset(0, 6), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: devheight(context) / 7,
                          left: devwidth(context) / 3),
                      child: SizedBox(
                        height: 45,
                        width: 180,
                        child: RaisedButton(
                          color: Colors.indigo[900],
                          onPressed: () async {
                            final QuerySnapshot result = await Firestore
                                .instance
                                .collection('utilisateurs')
                                .where('ID_utilisateur', isEqualTo: _verfc.text)
                                .where('type', isEqualTo: 'conducteur')
                                .limit(1)
                                .getDocuments();
                            if (result.documents.isNotEmpty) {
                              String id = result.documents[0].documentID;
                              print("================existant===============");
                              print(id);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Infos(
                                            docid: id,
                                          )));
                            } else {
                              print("-----------inexistant--------");
                              SnackBar(
                                content: Text("Inexistant"),
                              );
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "Valider",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
