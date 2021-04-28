import 'package:accidenyally/colors.dart';
import 'package:flutter/material.dart';

Widget getbody() {
  List items = ["1", "2", "3"];
  return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return getcard();
      });
}

Widget getcard() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 5),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: <Widget>[
              Container(
                width: 300,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // ici *******
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text("Constat N°xxxxx",
                          style: TextStyle(
                              color: bluecolor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 5),
                      child: Text(
                        "BD , Mohammed 6",
                        style: TextStyle(color: bluecolor),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 10, left: 2),
                            alignment: FractionalOffset(0.1, 12),
                            child: Text("12/12/2021",
                                style: TextStyle(color: griscolor)),
                          ),
                          Container(
                              alignment: FractionalOffset(0.1, 12),
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.only(top: 0, left: 42),
                                    child: Text("15:12",
                                        style: TextStyle(color: griscolor)),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: IconButton(
                                            icon: Image.asset(
                                                "assets/icons/supprimer.png"),
                                            onPressed: () {},
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.trending_neutral,
                                        size: 32,
                                      ),
                                      color: pyscolors,
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //photo du constat
            ],
          ),
        ),
      ),
    ),
  );
}
