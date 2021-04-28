import 'package:flutter/material.dart';

import '../colors.dart';

class Genercons extends StatefulWidget {
  @override
  _GenerconsState createState() => _GenerconsState();
}

class _GenerconsState extends State<Genercons> {
  List items = ["1"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CnBconsat();
        });
  }
}

class CnBconsat extends StatefulWidget {
  @override
  _CnBconsatState createState() => _CnBconsatState();
}

class _CnBconsatState extends State<CnBconsat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0, left: 5),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 11),
            child: Row(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text("Constat N°xxxxx",
                            style: TextStyle(
                                color: bluecolor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 5),
                        child: Text(
                          "BD , Mohammed 6",
                          style: TextStyle(color: bluecolor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 2),
                        child: Text("En cours de traitement",
                            style: TextStyle(color: blufanccolor)),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 2),
                              alignment: FractionalOffset(0.1, 12),
                              child: Text("12/12/2021",
                                  style: TextStyle(color: griscolor)),
                            ),
                            Container(
                                alignment: FractionalOffset(0.1, 12),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, left: 20),
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
                                                  "assets/icons/pen_modifier.png"),
                                              /* onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Boddy()));
                                            },*/
                                              onPressed: () {},
                                            ),
                                          ),
                                          Container(
                                            child: IconButton(
                                              icon: Image.asset(
                                                  "assets/icons/supprimer.png"),
                                              onPressed: () {},
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //photo du constat
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://bottarolaw.com/wp-content/uploads/2018/05/IMG_1894.jpg")),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
