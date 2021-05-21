import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

import '../../colors.dart';
import 'Témoins/temoin.dart';
import 'degat/degat_app.dart';

class Pointdimpacte extends StatefulWidget {
  @override
  _PointdimpacteState createState() => _PointdimpacteState();
}

class _PointdimpacteState extends State<Pointdimpacte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Points D'impacts",
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
      body: Point_imp(),
    );
  }
}

class Point_imp extends StatefulWidget {
  @override
  _Point_impState createState() => _Point_impState();
}

class _Point_impState extends State<Point_imp> {
  Color _colorbk = bluecolor;
  bool _rc1 = true;
  bool _rc2 = true;
  bool _rc3 = true;
  bool _rc4 = true;
  bool _rc5 = true;
  bool _rc6 = true;
  bool _rc7 = true;
  bool _rc8 = true;

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
    /*var timg = storageUploadTask;

    var imgurl = await (await timg.onComplete).ref.getDownloadURL();
    Firestore.instance
        .collection('utilisateurs')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .setData({
      'imgex': imgurl,
    });*/
    /**************************/

    await storageUploadTask.onComplete;
    this.setState(() {
      loading = false;
      print("image n' est pas enregestrer ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 18,
            left: MediaQuery.of(context).size.width / 5.91,
            child: Container(
              child: Text(
                " Marquer les points d'impacts sur \nvotre véhicule !!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 17,
                ),
              ),
            )),
        RepaintBoundary(
          key: _containerKey,
          child: Stack(
            children: [
              Stack(
                children: [
                  Positioned(
                      top: 1,
                      left: 1,
                      // right: 1,
                      height: 600,
                      width: 395,
                      child: Image.asset("assets/images/Car_point-amp.png")),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 3,
                    left: MediaQuery.of(context).size.height / 19,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_right_alt_rounded,
                        size: 50,
                        color: _rc1 ? _colorbk : rougggecolor,
                      ),
                      onPressed: () {
                        setState(() {
                          _rc1 = !_rc1;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.83,
                    right: MediaQuery.of(context).size.height / 25,
                    child: Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 50,
                          color: _rc2 ? _colorbk : rougggecolor,
                        ),
                        onPressed: () {
                          setState(() {
                            _rc2 = !_rc2;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 16,
                    left: MediaQuery.of(context).size.height / 4.50,
                    child: Transform.rotate(
                      angle: 90 * math.pi / 180,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 50,
                          color: _rc3 ? _colorbk : rougggecolor,
                        ),
                        onPressed: () {
                          setState(() {
                            _rc3 = !_rc3;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.58,
                    left: MediaQuery.of(context).size.height / 4.8,
                    child: Transform.rotate(
                      angle: 269 * math.pi / 180,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 50,
                          color: _rc4 ? _colorbk : rougggecolor,
                        ),
                        onPressed: () {
                          setState(() {
                            _rc4 = !_rc4;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.7,
                    left: MediaQuery.of(context).size.height / 14,
                    child: Transform.rotate(
                      angle: -32 * math.pi / 180,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 50,
                          color: _rc5 ? _colorbk : rougggecolor,
                        ),
                        onPressed: () {
                          setState(() {
                            _rc5 = !_rc5;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.64,
                    right: MediaQuery.of(context).size.height / 14,
                    child: Transform.rotate(
                      angle: -150 * math.pi / 180,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 50,
                          color: _rc6 ? _colorbk : rougggecolor,
                        ),
                        onPressed: () {
                          setState(() {
                            _rc6 = !_rc6;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 11,
                    right: MediaQuery.of(context).size.height / 14,
                    child: Transform.rotate(
                      angle: -230 * math.pi / 180,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 50,
                          color: _rc7 ? _colorbk : rougggecolor,
                        ),
                        onPressed: () {
                          setState(() {
                            _rc7 = !_rc7;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 12,
                    left: MediaQuery.of(context).size.height / 12,
                    child: Transform.rotate(
                      angle: -320 * math.pi / 180,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 50,
                          color: _rc8 ? _colorbk : rougggecolor,
                        ),
                        onPressed: () {
                          setState(() {
                            _rc8 = !_rc8;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              (loading)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center()
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyPainter()));
                  //convertWidgetToImage();
                },
                child: Icon(
                  Icons.trending_flat_rounded,
                  color: Colors.white,
                  size: 45,
                ),
              )),
        ),
      ],
    );
  }
}
