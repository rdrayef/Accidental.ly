import 'package:accidenyally/accueil/menu.dart/menu.dart';
import 'package:accidenyally/services/body.dart';
import 'package:flutter/material.dart';

class Servicess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Text('Services',
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
        body: Content(),
        /*SafeArea(
          child: Row(
            children: [
              Container(
                child: Column(
            children: [
            Container(
              child: Dashboard(),
          ),
              Container(
              child: service(),
          ),
            ],
              ),
              ),
            ],
          ),
        )*/
      ),
    );
  }
}
