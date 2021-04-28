import 'package:flutter/material.dart';

class Prfl extends StatefulWidget {
  @override
  _PrflState createState() => _PrflState();
}

class _PrflState extends State<Prfl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Profile"),
      ),
    );
  }
}
