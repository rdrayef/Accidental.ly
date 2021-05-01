import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../colors.dart';
import 'cercle.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class Headerf extends StatefulWidget {
  @override
  _HeaderfState createState() => _HeaderfState();
}

final now = new DateTime.now();
String formatter = DateFormat('dd/MM/yyyy HH:mm').format(now);
var _userName;
var imgp;

class _HeaderfState extends State<Headerf> {
  @override
  Widget build(BuildContext context) {
    double devwidth(BuildContext context) => MediaQuery.of(context).size.width;
    double devheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
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
          _userName = snapshot.data['Prenom'];
          imgp = snapshot.data['img_profile'];

          return Container(
            margin: EdgeInsets.only(bottom: devheight(context) * 0.01),
            height: size.height * 0.34,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                    bottom: devheight(context) / 15,
                  ),
                  height: size.height * 0.26,
                  decoration: BoxDecoration(
                    color: bluecolor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(190),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                            child: Text(formatter,
                                style: TextStyle(color: griscolor)),
                          ),
                          Spacer(),
                        ]),
                      ),
                      /******************** */
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                            margin: const EdgeInsets.fromLTRB(1, 0.5, 0, 2),
                            child: Text(
                              'Bienvenue, ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              _userName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      color: rougecolor,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0.5, 0, 15),
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: CircleAvatar(
                                backgroundColor: bluecolor,
                                backgroundImage: NetworkImage(imgp),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      /*********************** */
                    ],
                  ),
                ),
                //SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        /***1 */
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            left: devwidth(context) / 25,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: devwidth(context) / 17),
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: bluecolor.withOpacity(0.23),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Text('Conduite',
                                    style: TextStyle(color: griscolor)),
                              ),
                              Container(
                                alignment: FractionalOffset(0.2, 12),
                                child: Image.asset(
                                    "assets/icons/icons8-volant-26.png"),
                              ),
                              Container(child: Cerclepage(50.00)),
                            ],
                          ),
                        ),
                        /***1 */
                        /**2 */
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            left: devwidth(context) / 17,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: devwidth(context) / 17),
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: bluecolor.withOpacity(0.23),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Text('Accident',
                                    style: TextStyle(color: griscolor)),
                              ),
                              Container(
                                  child: Image.asset(
                                      "assets/icons/icons8-voiture-accidentée-24.png")),
                              Container(child: Cerclepage(30.00)),
                            ],
                          ),
                        ),
                        /***2 */
                        /**3 */
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            left: devwidth(context) / 14,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: devwidth(context) / 17),
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: bluecolor.withOpacity(0.23),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Text('   Score  ',
                                    style: TextStyle(color: griscolor)),
                              ),
                              Container(
                                  child: Image.asset(
                                      "assets/icons/icons8-étoilé-remplie-26.png")),
                              Container(child: Cerclepage(70.00)),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          );
        });
  }
}

Stream<DocumentSnapshot> StreamGetuserdoc(BuildContext context) async* {
  final mid = (await FirebaseAuth.instance.currentUser()).uid;
  yield* Firestore.instance
      .collection('utilisateurs')
      .document(mid)
      .snapshots();
}
