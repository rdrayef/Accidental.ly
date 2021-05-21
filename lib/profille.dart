import 'dart:io';
import 'package:accidenyally/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'dart:ui';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Prfl extends StatefulWidget {
  @override
  _PrflState createState() => _PrflState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

class _PrflState extends State<Prfl> {
  File _image;

  Future resetEmail() async {
    var message;
    FirebaseUser firebaseUser = await auth.currentUser();
    firebaseUser
        .updateEmail(_emailcontroller.text)
        .then(
          (value) => message = 'Success',
        )
        .catchError((onError) => message = 'error');
    return message;
  }

  Future<void> update() async {
    //  final user = await FirebaseAuth.instance.currentUser();
    var storigeimg = FirebaseStorage.instance.ref().child(_image.path);
    var timg = storigeimg.putFile(_image);
    var imgurl = await (await timg.onComplete).ref.getDownloadURL();
    // var rl = imgurl.toString();
    return Firestore.instance
        .collection('utilisateurs')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .updateData({
      // 'ID_utilisateur': _idcontroller.text,
      'Nom': _nomcontroller.text,
      'Prenom': _prenomcontroller.text,
      'Adresse': _adressecontroller.text,
      'CIN': _cincontroller.text,
      'Login': _emailcontroller.text,
      'img_profile': imgurl,
      // 'Password': _pswdcontroller.text,
      'Date_naissance': _datenaissancecontroller.text,
    });
  }

  TextEditingController _emailcontroller = TextEditingController();
  // TextEditingController _pswdcontroller = TextEditingController();
  TextEditingController _nomcontroller = TextEditingController();
  TextEditingController _prenomcontroller = TextEditingController();
  TextEditingController _cincontroller = TextEditingController();
  TextEditingController _datenaissancecontroller = TextEditingController();
  TextEditingController _adressecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future getImage(BuildContext context) async {
      // ignore: deprecated_member_use
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
      Navigator.of(context).pop();
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

    // ignore: unused_element
    Future getImage1(BuildContext context) async {
      // ignore: deprecated_member_use
      var image = await ImagePicker.pickImage(source: ImageSource.camera);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
      Navigator.of(context).pop();
    }

    Widget bottomsheet() {
      return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Text("choose profile photos",
                style: TextStyle(
                  fontSize: 20.0,
                )),
            SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  getImage1(context);
                },
                label: Text("camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  getImage(context);
                },
                label: Text("Gallery"),
              ),
            ])
          ],
        ),
      );
    }

    return StreamBuilder(
        stream: StreamGetuserdoc(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  color: bluecolor,
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.save_sharp,
                    color: Colors.indigo[900],
                  ),
                  onPressed: () {
                    update();
                    uploadPic(context);
                    resetEmail();
                  },
                ),
              ],
            ),
            body: Container(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "Modifier le Profile",
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(30),
                        color: Colors.indigo[50],
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Align(
                                  child: CircleAvatar(
                                    radius: 50,
                                    child: ClipOval(
                                      child: SizedBox(
                                          height: 180,
                                          width: 180,
                                          child: (_image != null)
                                              ? Image.file(
                                                  _image,
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.network(
                                                  snapshot.data['img_profile'],
                                                  fit: BoxFit.fill,
                                                )),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20.0,
                                  right: 20.0,
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: ((Builder) => bottomsheet()),
                                      );
                                    },
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.black,
                                      size: 28.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _nomcontroller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.border_color,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        labelText: "Nom",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: snapshot.data['Nom'],
                        hintStyle: TextStyle(color: Colors.black54),
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _prenomcontroller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        labelText: "PRENOM",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: snapshot.data['Prenom'],
                        hintStyle: TextStyle(color: Colors.black54),
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _cincontroller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        labelText: "CIN",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: snapshot.data['CIN'],
                        hintStyle: TextStyle(color: Colors.black54),
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        labelText: "EMAIL",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: snapshot.data['Login'],
                        hintStyle: TextStyle(color: Colors.black54),
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _datenaissancecontroller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.date_range,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        labelText: "DATE NAISSANCE",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: snapshot.data['Date_naissance'],
                        hintStyle: TextStyle(color: Colors.black54),
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _adressecontroller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        labelText: "ADRESSE",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: snapshot.data['Adresse'],
                        hintStyle: TextStyle(color: Colors.black54),
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Stream<DocumentSnapshot> StreamGetuserdoc(BuildContext context) async* {
  final mid = (await FirebaseAuth.instance.currentUser()).uid;
  yield* Firestore.instance
      .collection('utilisateurs')
      .document(mid)
      .snapshots();
}
