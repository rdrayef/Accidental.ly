import 'package:accidenyally/accueil/menu.dart/menu.dart';
import 'package:accidenyally/constateur/menu.dart';
import 'package:accidenyally/notification/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance
          .collection('utilisateurs')
          .document(user.uid)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return checkRole(snapshot.data);
        }
        return null;
      },
    );
  }

  Widget checkRole(DocumentSnapshot snapshot) {
    if (snapshot.data == null) {
      print('null values');
      return null;
    }
    if (snapshot.data['type'] == 'constateur') {
      return adminPage(snapshot);
    } else {
      return userPage(snapshot);
    }
  }

  Widget adminPage(DocumentSnapshot snapshot) {
    return Constateur();
  }

  Widget userPage(DocumentSnapshot snapshot) {
    return Accueil();
  }
}
