import 'package:accidenyally/colors.dart';
import 'package:accidenyally/constateur/Declaration/assurance.dart';
import 'package:accidenyally/constateur/Declaration/cmb_marque.dart';
import 'package:flutter/material.dart';

class Infosvehicule extends StatelessWidget {
  String docid;
  Infosvehicule({this.docid});
  @override
  Widget build(BuildContext context) {
    double devwidth(BuildContext context) => MediaQuery.of(context).size.width;
    double devheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text("Informations véhicule",
                style: TextStyle(
                    color: bluecolor,
                    fontSize: 23,
                    fontWeight: FontWeight.w600)),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.car_repair,
                size: 30,
                color: rougggecolor,
              ),
              onPressed: () {},
            )),
        backgroundColor: bluecolors2,
        body: Container(
          margin: EdgeInsets.only(top: devheight(context) * 0.025),
          child: SingleChildScrollView(
            child: Column(children: [
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
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Immatriculation',
                            labelText: 'Immatriculation',
                            suffixIcon: Icon(
                              Icons.money_rounded,
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

                    ///////////////////combo
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
                        child: drpdwn()),
                    //////////////////combo
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
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Modèle',
                          labelText: 'Modèle',
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
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
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
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Type',
                          labelText: 'Type',
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
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
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
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Départ',
                          labelText: 'Départ',
                          suffixIcon: Icon(
                            Icons.south_east_rounded,
                            color: bluecolor,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
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
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Déstination',
                          labelText: 'Déstination',
                          suffixIcon: Icon(
                            Icons.north_east_rounded,
                            color: bluecolor,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 2),
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
                    ),
                    SizedBox(
                      height: devheight(context) * 0.05,
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
                                    builder: (context) => Infosassurance(),
                                  ));
                            },
                            child: Icon(
                              Icons.trending_flat_rounded,
                              color: Colors.white,
                              size: 45,
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
