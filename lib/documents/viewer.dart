import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class Pdfloader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDF(
        swipeHorizontal: true,
      ).cachedFromUrl('http://africau.edu/images/default/sample.pdf'),
    );
  }
}
