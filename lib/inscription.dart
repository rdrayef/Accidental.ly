import 'package:accidenyally/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  void initState() {
    var uuid = Uuid();
    var v4_crypto = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
    super.initState();
    _idcontroller.text = v4_crypto.substring(0, 8);
  }

  final _formkey = GlobalKey<FormState>();
  TextEditingController _idcontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _pswdcontroller = TextEditingController();
  TextEditingController _nomcontroller = TextEditingController();
  TextEditingController _prenomcontroller = TextEditingController();
  TextEditingController _cincontroller = TextEditingController();
  TextEditingController _datenaissancecontroller = TextEditingController();
  TextEditingController _adressecontroller = TextEditingController();
  void dispose() {
    _idcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.indigo[900], Colors.indigo[900]]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 3,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Inscription",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "inscris vous maintenant!",
                    style: TextStyle(color: Colors.white24, fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextFormField(
                                    readOnly: true,
                                    controller: _idcontroller,
                                    decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: "ID",
                                      /* hintText: v4_crypto.substring(0, 8), */
                                      hintStyle: TextStyle(color: Colors.black),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextField(
                                    controller: _nomcontroller,
                                    decoration: InputDecoration(
                                      labelText: "Nom",
                                      hintText: "saisi votre nom de famille",
                                      hintStyle: TextStyle(color: Colors.black),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextField(
                                    controller: _prenomcontroller,
                                    decoration: InputDecoration(
                                      labelText: "prénom",
                                      hintText: "saisi votre prénom",
                                      hintStyle: TextStyle(color: Colors.black),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextField(
                                    controller: _cincontroller,
                                    decoration: InputDecoration(
                                      labelText: "CIN",
                                      hintText: "saisi votre CIN",
                                      hintStyle: TextStyle(color: Colors.black),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextField(
                                    controller: _emailcontroller,
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      hintText: "exemple@gmail.com",
                                      hintStyle:
                                          TextStyle(color: Colors.black12),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextField(
                                    controller: _pswdcontroller,
                                    decoration: InputDecoration(
                                      labelText: "Mot de passe",
                                      hintStyle: TextStyle(color: Colors.black),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                    obscureText: true,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextField(
                                    controller: _datenaissancecontroller,
                                    decoration: InputDecoration(
                                      labelText: "Date Naissance",
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextField(
                                    controller: _adressecontroller,
                                    decoration: InputDecoration(
                                      labelText: "Adresse",
                                      hintText: "exemple@gmail.com",
                                      hintStyle:
                                          TextStyle(color: Colors.black12),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 50),
                                  child: Container(
                                    child: SizedBox(
                                      height: 45,
                                      width: 180,
                                      child: RaisedButton(
                                        color: bluecolor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Text(
                                          "S'inscrire",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24),
                                        ),
                                        onPressed: () async {
                                          var result = await FirebaseAuth
                                              .instance
                                              .createUserWithEmailAndPassword(
                                                  email: _emailcontroller.text,
                                                  password:
                                                      _pswdcontroller.text);
                                          if (result != null) {
                                            Firestore.instance
                                                .collection('utilisateurs')
                                                .document(result.uid)
                                                .setData({
                                              'ID_utilisateur':
                                                  _idcontroller.text,
                                              'Nom': _nomcontroller.text,
                                              'Prenom': _prenomcontroller.text,
                                              'Adresse':
                                                  _adressecontroller.text,
                                              'CIN': _cincontroller.text,
                                              'Login': _emailcontroller.text,
                                              'Password': _pswdcontroller.text,
                                              'Date_naissance':
                                                  _datenaissancecontroller.text,
                                            });
                                          } else {
                                            print('not inserted');
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
