import 'package:accidenyally/colors.dart';
import 'package:accidenyally/parametres.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chpm extends StatefulWidget {
  @override
  _ChpmState createState() => _ChpmState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
var motpass;

class _ChpmState extends State<Chpm> {
  Future<void> _getUserName() async {
    Firestore.instance
        .collection('utilisateurs')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get()
        .then((value) {
      setState(() {
        motpass = value.data['Password'];
      });
    });
  }

  Future changePassword() async {
    var message;
    if ((_anccontroller.text == motpass) &
        (_nv1controller.text == _nv2rcontoller.text)) {
      FirebaseUser firebaseUser = await auth.currentUser();
      firebaseUser
          .updatePassword(_nv1controller.text)
          .then(
            (value) => message = 'Success',
          )
          .catchError((onError) => message = 'error');
      return message;
    } else {}
    print("il ya une erreur de vérification");
  }

  Future update() async {
    if ((_anccontroller.text == motpass) &
        (_nv1controller.text == _nv2rcontoller.text)) {
      return Firestore.instance
          .collection('utilisateurs')
          .document((await FirebaseAuth.instance.currentUser()).uid)
          .updateData({
        'Password': _nv1controller.text,
      });
    }
  }

  @override
  void initState() {
    _getUserName();
    super.initState();
  }

  TextEditingController _nv1controller = TextEditingController();
  TextEditingController _nv2rcontoller = TextEditingController();
  TextEditingController _anccontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Changer mot de passe",
              style: TextStyle(color: bluecolor, fontSize: 20)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.save_alt_rounded,
                color: Colors.indigo[900],
              ),
              onPressed: () {
                changePassword();
                update();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Parametres()),
                );
              },
            ),
          ],
        ),
        body: Container(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _anccontroller,
                decoration: InputDecoration(
                  labelText: "Ancien Mot de passe",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.black54),
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _nv1controller,
                decoration: InputDecoration(
                  labelText: "Nouveau mot de passe",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.black54),
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _nv2rcontoller,
                decoration: InputDecoration(
                  labelText: "Confirmer le nouveau mot de passe",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.black54),
                  labelStyle: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ]),
        ));
  }
}
