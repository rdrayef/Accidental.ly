import 'dart:math';
import 'dart:ui';

import 'package:accidenyally/colors.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class cercle extends CustomPainter {
  final strokeCircle = 12.0;
  double currentProgrese;
  cercle(this.currentProgrese);
  @override
  void paint(Canvas canvas, Size size) {
    Paint cercle = Paint();
    cercle.strokeWidth = strokeCircle;
    cercle.color = griscolor.withOpacity(0.23);
    cercle.style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 30;
    canvas.drawCircle(center, radius, cercle);

    //draw animation
    cercle.strokeWidth = strokeCircle;
    cercle.color = bluecolor;
    cercle.style = PaintingStyle.stroke;
    cercle.strokeCap = StrokeCap.round;
    double angle = 2 * pi * (currentProgrese / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, cercle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Cerclepage extends StatefulWidget {
  final porecentage;
  Cerclepage(this.porecentage);

  @override
  _CerclepageState createState() {
    return _CerclepageState(porecentage);
  }
}

class _CerclepageState extends State<Cerclepage>
    with SingleTickerProviderStateMixin {
  //final maxpregresse = 70.0;
  final porecentage;

  _CerclepageState(this.porecentage);

  // ignore: unused_field
  AnimationController _animationController;
  // ignore: unused_field
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));

    _animation =
        Tween<double>(begin: 0, end: porecentage).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: CustomPaint(
          foregroundPainter: cercle(_animation.value),
          child: Container(
            width: 10,
            height: 120,
            //     color: Colors.red,
            child: InkWell(
              /* onTap: () {
                if (_animation.value == porecentage) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
              },*/
              child: Center(
                child: Text(
                  '${_animation.value.toInt()}',
                  style: TextStyle(fontSize: 6),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
Widget fcercl(int p) {
  return Cerclepage(p);
}
*/
