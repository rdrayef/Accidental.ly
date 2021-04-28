import 'package:accidenyally/ajouter.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Headerf(),
          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      /***********************************blue********************************************** */
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 0.0, top: 70),
                        height: 85,
                        width: 170,
                        decoration: BoxDecoration(
                          color: bluecolors,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.white.withOpacity(0.5), // ici *******
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: new EdgeInsets.only(top: 16.0),
                              alignment: FractionalOffset(0.2, 12),
                              child: Text(
                                ' Ajouter véhicule',
                                style:
                                    TextStyle(color: bluecolor, fontSize: 15),
                              ),
                            ),
                            Container(
                              padding: new EdgeInsets.only(top: 3.0),
                              alignment: FractionalOffset(0.9, 12),
                              /*child: Image.asset(
                                  "assets/icons/icons8-plus-26.png"),*/
                              child: IconButton(
                                  icon: Image.asset(
                                      "assets/icons/icons8-plus-26.png"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ajouterpage(),
                                        ));
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      /****************************green********************************** */
                      Container(
                        margin: const EdgeInsets.only(
                            left: 0.0, right: 20.0, top: 70),
                        height: 85,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: new EdgeInsets.only(top: 14.0),
                              alignment: FractionalOffset(0.4, 18),
                              child: Text(
                                ' Mon assuré ',
                                style:
                                    TextStyle(color: bluecolor, fontSize: 16),
                              ),
                            ),
                            Container(
                              padding: new EdgeInsets.only(top: 3.0),
                              alignment: FractionalOffset(0.9, 12),
                              child: Icon(
                                Icons.trending_neutral,
                                color: bluecolor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                /***********************************red************************************************* */
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 70.0, right: 0.0, top: 70),
                        height: 90,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        //child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: new EdgeInsets.only(top: 5.0),
                              alignment: FractionalOffset(0.2, 14),
                              child: Text(
                                ' Constat N° : xxxx',
                                style:
                                    TextStyle(color: bluecolor, fontSize: 15),
                              ),
                            ),
                            Container(
                              // padding: new EdgeInsets.only(top: 0.2),
                              alignment: FractionalOffset(0.9, 12),
                              child: IconButton(
                                  icon: Icon(Icons.trending_neutral,
                                      color: bluecolor),
                                  onPressed: () {
                                    /*   Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Boddy(),
                                        )); */
                                  }),
                            ),
                            Container(
                              padding: new EdgeInsets.only(top: 0),
                              alignment: FractionalOffset(0.2, 12),
                              child: Text(
                                ' traité',
                                style:
                                    TextStyle(color: vertcolor, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                      /****** */
                    ],
                  ),
                )
                /************* */
              ],
            ),
          )
        ],
      ),
    );
  }
}
