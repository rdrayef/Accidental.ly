import 'package:accidenyally/colors.dart';
import 'package:flutter/material.dart';

class Heure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bluecolors2,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Dégats et observations",
              style: TextStyle(
                  color: bluecolor, fontSize: 23, fontWeight: FontWeight.w600)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.car_repair,
              size: 30,
              color: rougggecolor,
            ),
            onPressed: () {},
          )),
      body: Emplacements(),
    );
  }
}

class Emplacements extends StatefulWidget {
  @override
  _EmplacementsState createState() => _EmplacementsState();
}

class _EmplacementsState extends State<Emplacements> {
  TextEditingController _adr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size devwidth = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: devwidth.height * 0.1),
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
                  width: devwidth.width * 0.9,
                  child: TextField(
                    controller: _adr,
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Dégats apparents',
                      labelText: 'Dégats apparents',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: blufanccolor.withOpacity(0.1)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: devwidth.height * 0.1),
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
                  width: devwidth.width * 0.9,
                  child: TextField(
                    // controller: ,
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Observations',
                      labelText: 'Observations',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: blufanccolor.withOpacity(0.1)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: devwidth.width / 1.6,
                right: devwidth.width * 0.045,
                top: devwidth.height * 0.1),
            child: SizedBox(
                height: 50,
                width: 120,
                child: RaisedButton(
                  color: bluecolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => null));
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
    );
  }
}
