import 'package:accidenyally/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.33,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _mediaStack(
                "assets/images/pdf.png",
                rougecolor,
                Colors.pink,
                "Fichiers PDF",
                "12 objets",
                Colors.red[900],
                Icons.east_rounded,
                Colors.white),
            SizedBox(
              width: 12,
            ),
            _mediaStack(
                "assets/images/image.png",
                Colors.yellow[900],
                Colors.yellow[700],
                "Images",
                "53 objets",
                Colors.yellow[800],
                Icons.east_rounded,
                Colors.white),
            SizedBox(
              width: 12,
            ),
            _mediaStack(
                "assets/images/paint.png",
                Colors.indigo[600],
                Colors.indigo[800],
                "Illustrations",
                "15 objets",
                Colors.indigo[600],
                Icons.east_rounded,
                Colors.white),
          ],
        ),
      ),
    );
  }
}

void newMethod() {}

Widget _mediaStack(String image, Color scolor, Color encolor, String media,
    String item, Color shadow, IconData icon, Color iconcolor) {
  return Stack(
    children: <Widget>[
      Opacity(
        opacity: 0.9,
        child: Container(
          height: 177,
          width: 168,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              gradient: LinearGradient(
                  colors: [scolor, encolor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              boxShadow: [
                BoxShadow(color: scolor, blurRadius: 1.5, offset: Offset(0, 6)),
              ]),
        ),
      ),
      Positioned(
        top: 25,
        left: 10,
        child: Opacity(
          opacity: 1,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                    color: shadow, offset: Offset(2.0, 5.0), blurRadius: 18.0),
              ],
            ),
            child: Image.asset(image),
            height: 40,
          ),
        ),
      ),
      Positioned(
        top: 82,
        left: 15,
        child: Column(
          children: [
            Text(
              media + "\n" + "\n" + item,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 125,
        left: 130,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(icon, color: Colors.black),
            ),
          ],
        ),
      ),
    ],
  );
}
