import 'package:accidenyally/colors.dart';
import 'package:accidenyally/constateur/Declaration/Information_vehicule.dart';
import 'package:accidenyally/constateur/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Infos extends StatefulWidget {
  String docid;
  String v;
  Infos({Key key, @required this.docid}) : super(key: key);
  var nom, prenom, cin, email, motpass, dtnss, adresse, imgp;
  Future<void> _getUserName() async {
    Firestore.instance
        .collection('utilisateurs')
        .document(docid)
        .get()
        .then((value) {
      nom = value.data['Nom'];
      prenom = value.data['Prenom'];
      cin = value.data['CIN'];
      email = value.data['Login'];
      // motpass = value.data['Password'];
      dtnss = value.data['Date_naissance'];
      adresse = value.data['Adresse'];
      imgp = value.data['img_profile'];
      print(nom + prenom + cin + imgp);
    });
  }

  @override
  _InfosState createState() => _InfosState(docid: docid);
  void initState() {
    // TODO: implement initState
    _getUserName();
  }
}

class _InfosState extends State<Infos> {
  String docid;
  _InfosState({this.docid});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nom = TextEditingController();
    TextEditingController _prenom = TextEditingController();
    TextEditingController _cin = TextEditingController();
    TextEditingController _img = TextEditingController();
    TextEditingController _adresse = TextEditingController();
    double devwidth(BuildContext context) => MediaQuery.of(context).size.width;
    double devheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    return StreamBuilder(
        stream: StreamGetuserdoc(context),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Scaffold(
                backgroundColor: Colors.white,
                /* width: MediaQuery.of(context).size.width * 0.1,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  color: Colors.orange,
                ), */
              ),
            );
          }

          return Scaffold(
              appBar: new AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text("Information personelle",
                      style: TextStyle(
                          color: bluecolor,
                          fontSize: 23,
                          fontWeight: FontWeight.w600)),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.cancel_rounded,
                      size: 30,
                      color: rougggecolor,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Constateur(),
                          ));
                    },
                  )),
              backgroundColor: bluecolors2,
              body: Container(
                margin: EdgeInsets.only(top: devheight(context) * 0.025),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Align(
                      child: CircleAvatar(
                        backgroundColor: bluecolor,
                        radius: 50,
                        child: ClipOval(
                          child: SizedBox(
                            width: 100,
                            child: Image.network(
                              "https://firebasestorage.googleapis.com/v0/b/accidentally-d3dca.appspot.com/o/user.jpg?alt=media&token=a4a11c90-990b-455b-a545-36eedd5a1213",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: devheight(context) * 0.05,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 5),
                                    blurRadius: 10.0,
                                    color: blufanccolor.withOpacity(0.5),
                                  ),
                                ],
                              ),
                              width: devwidth(context) * 0.9,
                              child: TextField(
                                controller: _nom,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: "Nom",
                                  labelText: snapshot.data['Nom'],
                                  suffixIcon: Icon(
                                    Icons.person,
                                    color: bluecolor,
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: blufanccolor),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: devheight(context) * 0.03,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 10.0,
                                  color: blufanccolor.withOpacity(0.5),
                                ),
                              ],
                            ),
                            width: devwidth(context) * 0.9,
                            child: TextField(
                              controller: _prenom,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'prénom',
                                labelText: 'Prénom',
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: bluecolor,
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: blufanccolor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: devheight(context) * 0.03,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 10.0,
                                  color: blufanccolor.withOpacity(0.5),
                                ),
                              ],
                            ),
                            width: devwidth(context) * 0.9,
                            child: TextField(
                              controller: _cin,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'CIN',
                                labelText: 'CIN',
                                suffixIcon: Icon(
                                  Icons.badge,
                                  color: bluecolor,
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: blufanccolor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: devheight(context) * 0.03,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 10.0,
                                  color: blufanccolor.withOpacity(0.5),
                                ),
                              ],
                            ),
                            width: devwidth(context) * 0.9,
                            child: TextField(
                              controller: _adresse,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Adresse',
                                labelText: 'Adresse',
                                suffixIcon: Icon(
                                  Icons.house,
                                  color: bluecolor,
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: blufanccolor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: devheight(context) * 0.1,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: devwidth(context) / 1.6,
                                right: devwidth(context) * 0.045),
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
                                          builder: (context) =>
                                              Infosvehicule(docid: docid),
                                        ));
                                  },
                                  child: Icon(
                                    Icons.trending_flat_rounded,
                                    color: Colors.white,
                                    size: 45,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ));
        });
  }

  Stream<DocumentSnapshot> StreamGetuserdoc(BuildContext context) async* {
    yield* Firestore.instance
        .collection('utilisateurs')
        .document(docid)
        .snapshots();
  }
}
