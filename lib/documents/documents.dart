import 'package:accidenyally/accueil/menu.dart/menu.dart';
import 'package:accidenyally/colors.dart';
import 'package:accidenyally/documents/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'categories.dart';

class Documents extends StatefulWidget {
  @override
  _DocumentsState createState() => _DocumentsState();
}

double espace = 1240.00;
double percent = espace / 5000;

String userid;
void _getUser() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  userid = user.uid;
}

class _DocumentsState extends State<Documents> {
  String espaces = espace.toStringAsFixed(2);
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Text('Documents',
              style: TextStyle(
                  fontSize: 25,
                  backgroundColor: Colors.transparent,
                  color: Colors.deepPurple[900])),
          centerTitle: true,
          leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.deepPurple[900],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Accueil(),
                    ));
              }),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              padding: const EdgeInsets.all(10.0),
              height: size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [Colors.indigo[800], Colors.indigo[600]],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  boxShadow: [
                    BoxShadow(
                        color: bluecolor,
                        blurRadius: 1.5,
                        offset: Offset(0, 6)),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/folderempty.svg',
                    height: size.height * 0.13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Espace utilisé',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        espaces + ' MB',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      LinearPercentIndicator(
                        width: size.width * 0.6,
                        lineHeight: 8.0,
                        percent: percent,
                        progressColor: Colors.tealAccent[400],
                        backgroundColor: Colors.white,
                        animation: true,
                        animationDuration: 2000,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: size.height * 0.03),
                child: Categories()),
            Container(
              child: Text(
                'Mes Fichiers',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(child: Testscard())
          ],
        ),
      ),
    );
  }
}
