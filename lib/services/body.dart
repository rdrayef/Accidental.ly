import 'package:accidenyally/services/m_servicess.dart';
import 'package:accidenyally/services/service.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Container(child: Dashboard()),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
          child: Servicesse(),
        )
      ],
    ));
  }
}
