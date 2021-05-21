import 'dart:typed_data';

import 'package:accidenyally/constateur/Declaration/T%C3%A9moins/temoin.dart';
import 'package:accidenyally/constateur/Declaration/degat/dg_mat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

import '../../../colors.dart';

class MyPainter extends StatefulWidget {
  @override
  _MyPainterState createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter> {
  Color _colorbk = Colors.grey;
  bool _rc1 = true;
  bool _rc2 = true;
  bool _rc3 = true;
  bool _rc4 = true;
  bool _rc5 = true;
  bool _rc6 = true;
  bool _rc7 = true;
  void _rc1color() {
    setState(() {
      _rc1 = !_rc1;
    });
  }

  void _rc2color() {
    setState(() {
      _rc2 = !_rc2;
    });
  }

  void _rc3color() {
    setState(() {
      _rc3 = !_rc3;
    });
  }

  void _rc4color() {
    setState(() {
      _rc4 = !_rc4;
    });
  }

  void _rc5color() {
    setState(() {
      _rc5 = !_rc5;
    });
  }

  void _rc6color() {
    setState(() {
      _rc6 = !_rc6;
    });
  }

  void _rc7color() {
    setState(() {
      _rc7 = !_rc7;
    });
  }

  GlobalKey _containerKey = GlobalKey();
  StorageReference storageReference = FirebaseStorage().ref();
  bool loading = false;

  void convertWidgetToImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        _containerKey.currentContext.findRenderObject();
    ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uInt8List = byteData.buffer.asUint8List();
    this.setState(() {
      loading = true;
      print("image est enregestrer ");
    });
    StorageUploadTask storageUploadTask = storageReference
        .child("IMG_${DateTime.now().millisecondsSinceEpoch}.png")
        .putData(uInt8List);
    /************************/
    var timg = storageUploadTask;

    var imgurl = await (await timg.onComplete).ref.getDownloadURL();
    Firestore.instance
        .collection('utilisateurs')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .setData({
      'imgex': imgurl,
    });
    /**************************/

    await storageUploadTask.onComplete;
    this.setState(() {
      loading = false;
      print("image n' est pas enregestrer ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Dégâts apparents",
              style: TextStyle(
                  color: bluecolor, fontSize: 23, fontWeight: FontWeight.w600)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.directions_car_sharp, //commute_outlined
              size: 30,
              color: rougggecolor,
            ),
            onPressed: () {},
          )),
      backgroundColor: bluecolors2,
      body: Stack(children: <Widget>[
        Positioned(
            top: 23,
            left: MediaQuery.of(context).size.width / 5.91,
            child: Container(
              child: Text(
                " Sélectionner les Dégâts apparents \nsur votre véhicule !!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 17,
                ),
              ),
            )),
        RepaintBoundary(
          key: _containerKey,
          child: Container(
              child: Stack(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                      right: 1,
                      left: 1,
                      child: CustomPaint(
                        size: const Size(400, 324),
                        painter: Ri(
                          _rc1 ? _colorbk : bluecolor,
                        ),
                      )),
                  Positioned(
                      right: 1,
                      left: MediaQuery.of(context).size.width / 2.028,
                      top: 112,
                      child: Text(
                        "1",
                        style: TextStyle(color: bluecolor, fontSize: 20),
                      )),
                  Positioned(
                      right: 1,
                      left: 1,
                      top: 92,
                      child: CustomPaint(
                        size: const Size(550, 200),
                        painter: Rc4(
                          _rc2 ? _colorbk : pyscolors,
                        ),
                      )),
                  Positioned(
                      right: 1,
                      left: MediaQuery.of(context).size.width / 2.028,
                      top: 202,
                      child: Text(
                        "2",
                        style: TextStyle(color: bluecolor, fontSize: 20),
                      )),
                  Positioned(
                      right: 1,
                      left: 1,
                      top: 239,
                      child: CustomPaint(
                        size: const Size(550, 300),
                        painter: Rc7(
                          _rc4 ? _colorbk : blufanccolor,
                        ),
                      )),
                  Positioned(
                      right: 1,
                      left: MediaQuery.of(context).size.width / 2.028,
                      top: 352,
                      child: Text(
                        "4",
                        style: TextStyle(color: bluecolor, fontSize: 20),
                      )),
                  Positioned(
                      right: 1,
                      left: 1,
                      top: 330,
                      child: CustomPaint(
                        size: const Size(550, 300),
                        painter: Rc8(
                          _rc5 ? _colorbk : pyscolors,
                        ),
                      )),
                  Positioned(
                      right: 1,
                      left: MediaQuery.of(context).size.width / 2.028,
                      top: 460,
                      child: Text(
                        "5",
                        style: TextStyle(color: bluecolor, fontSize: 20),
                      )),
                  Positioned(
                      right: 1,
                      left: 1,
                      top: 330,
                      child: CustomPaint(
                        size: const Size(550, 300),
                        painter: Rcii(
                          _rc6 ? _colorbk : bluecolor,
                        ),
                      )),
                  Positioned(
                      right: 1,
                      left: MediaQuery.of(context).size.width / 2.028,
                      top: 520,
                      child: Text(
                        "6",
                        style: TextStyle(color: bluecolor, fontSize: 20),
                      )),
                  Positioned(
                      right: 1,
                      left: 1,
                      top: 135,
                      child: CustomPaint(
                        size: const Size(650, 355),
                        painter: Rc6(
                          _rc3 ? _colorbk : rougecolor,
                        ),
                      )),
                  Positioned(
                      right: 1,
                      left: MediaQuery.of(context).size.width / 1.4,
                      top: 310,
                      child: Text(
                        "3",
                        style: TextStyle(color: bluecolor, fontSize: 20),
                      )),
                  Positioned(
                      right: 1,
                      left: 1,
                      top: 135.5,
                      child: CustomPaint(
                        size: const Size(650, 353),
                        painter: Rc5(
                          _rc7 ? _colorbk : rougecolor,
                        ),
                      )),
                  Positioned(
                      right: 1,
                      left: MediaQuery.of(context).size.width / 3.9,
                      top: 310,
                      child: Text(
                        "7",
                        style: TextStyle(color: bluecolor, fontSize: 20),
                      )),
                ],
              ),
              (loading)
                  ? Center(
                      // child: CircularProgressIndicator(),
                      )
                  : Center()
            ],
          )),
        ),

        /*********************************************************** */
        Positioned(
          top: 150,
          left: 5,
          child: Column(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                //1
                child: CircleAvatar(
                  backgroundColor: bluecolor,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _rc1color();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 40,
                //2
                child: CircleAvatar(
                  backgroundColor: pyscolors,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _rc2color();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 40,
                //3
                child: CircleAvatar(
                  backgroundColor: rougggecolor,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _rc3color();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 40,
                //4
                child: CircleAvatar(
                  backgroundColor: blufanccolor,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _rc4color();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 40,
                //5
                child: CircleAvatar(
                  backgroundColor: moutrdcolor,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _rc5color();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 40,
                //6
                child: CircleAvatar(
                  backgroundColor: vertcolor,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _rc6color();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 40,
                //7
                child: CircleAvatar(
                  backgroundColor: rougggecolor,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _rc7color();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 600,
          right: 14,
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
                        builder: (context) => Temoins(
                          docid: null,
                        ),
                      ));
                  //convertWidgetToImage();
                },
                child: Icon(
                  Icons.trending_flat_rounded,
                  color: Colors.white,
                  size: 45,
                ),
              )),
        ),
      ]),
    );
  }
}
