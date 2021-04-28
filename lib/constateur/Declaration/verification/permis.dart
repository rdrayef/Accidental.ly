import 'package:accidenyally/colors.dart';
import 'package:accidenyally/constateur/Declaration/Information_vehicule.dart';
import 'package:flutter/material.dart';

import 'Géolocalisation/emplacement.dart';

class InfosPermis extends StatelessWidget {
  TextEditingController _dateexpController = TextEditingController();

  TextEditingController _dateatrController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double devwidth(BuildContext context) => MediaQuery.of(context).size.width;
    double devheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text("Informations Permis",
                style: TextStyle(
                    color: bluecolor,
                    fontSize: 23,
                    fontWeight: FontWeight.w600)),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.badge,
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
                            hintText: 'N° Permis',
                            labelText: 'N° Permis',
                            suffixIcon: Icon(
                              Icons.portrait_rounded,
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
                        controller: _dateatrController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Délivré le',
                          labelText: 'Délivré le',
                          suffixIcon: IconButton(
                            onPressed: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              _dateatrController.text =
                                  date.toString().substring(0, 10);
                            },
                            icon: Icon(
                              Icons.calendar_today,
                              color: bluecolor,
                            ),
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
                        controller: _dateexpController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Valable jusqu\'au',
                          labelText: 'Valable jusqu\'au',
                          suffixIcon: IconButton(
                            onPressed: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              _dateexpController.text =
                                  date.toString().substring(0, 10);
                            },
                            icon: Icon(
                              Icons.calendar_today,
                              color: bluecolor,
                            ),
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
                          hintText: 'Préfecture',
                          labelText: 'Préfecture',
                          suffixIcon: Icon(
                            Icons.account_balance_rounded,
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
                          hintText: 'Catégorie',
                          labelText: 'Catégorie',
                          suffixIcon: Icon(
                            Icons.category,
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
                                    builder: (context) => Emplacement(),
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
