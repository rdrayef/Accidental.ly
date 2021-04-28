/* import 'package:accidenyally/documents/viewer.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Pdf Viewer",
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: Scaffold(
          appBar: AppBar(
            title: Text("PDF Viewer"),
          ),
          body: Builder(
            builder: (context) => Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => /*Viewpdf()*/));
                    },
                    color: Colors.deepOrangeAccent[200],
                    child: Text(
                      "Open from url",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
 */
