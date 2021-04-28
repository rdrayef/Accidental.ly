import 'package:flutter/material.dart';

Widget getdecor(int id) {
  Color colorval;
  Image image;
  //Image image;
  switch (id) {
    case 1:
      colorval = Color(0xFFAFC2E7);
      image = Image.asset("assets/icons/user.png");
      break;
    case 2:
      colorval = Color(0xFFFF9100);
      image = Image.asset("assets/icons/traitement.png");
      break;
    case 3:
      colorval = Color(0xFF1AF028);
      image = Image.asset("assets/icons/initialiser.png");
      break;
    case 4:
      colorval = Color(0xFF301A93);
      image = Image.asset("assets/icons/verifier.png");
      break;
    default:
      colorval = Colors.black;
      image = Image.asset("assets/icons/icons8-service-24.png");
  }
  return CircleAvatar(
    backgroundColor: colorval,
    child: IconButton(
      icon: image,
      onPressed: () {},
      color: Colors.white,
    ),
  );
}

Widget getbody() {
  List items = ["1", "2"];
  return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return getcard();
      });
}

Widget getcard() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(top: 75.0, left: 5),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Container(child: getdecor(2)),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Votre constat est en cours de traitement",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "1 janvier.2021 10:45 ",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
