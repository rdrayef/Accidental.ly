import 'dart:async';
import 'package:accidenyally/anim.dart';
import 'package:accidenyally/login.dart';
import 'package:accidenyally/services/splash.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Homme(),
        backgroundColor: Colors.indigo[900],
      ),
    );
  }
}

enum KindOfAnimation {
  forward,
}

class AnimationAndCurveDemo extends StatefulWidget {
  AnimationAndCurveDemo({
    Key key,
    @required this.mainCurve,
    this.compareCurve,
    this.duration = const Duration(seconds: 1),
    this.kindOfAnim = KindOfAnimation.forward,
  })  : assert(duration != null && mainCurve != null && kindOfAnim != null),
        super(key: key);

  final Animatable<double> mainCurve;
  final Animatable<double> compareCurve;

  final Duration duration;
  final KindOfAnimation kindOfAnim;

  @override
  _AnimationAndCurveDemoState createState() => _AnimationAndCurveDemoState();
}

class _AnimationAndCurveDemoState extends State<AnimationAndCurveDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animatable<double> get _mainCurve => widget.mainCurve;
  Duration get _duration => widget.duration;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );
    super.initState();
    _controller.forward();
    startTime();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double devwidth(BuildContext context) => MediaQuery.of(context).size.width;
    double devheight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: devwidth(context) * 0.29),
          child: Row(
            children: [
              MyStatefulWidget(),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Align(
                      alignment: Alignment(
                          lerpDouble(-18, devwidth(context) / 300,
                              _mainCurve.evaluate(_controller)),
                          0),
                      child: child,
                    );
                  },
                  child: Image.asset("assets/images/car_left.png"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Align(
                      alignment: Alignment(
                          lerpDouble(18, -devwidth(context) / 300,
                              _mainCurve.evaluate(_controller)),
                          0),
                      child: child,
                    );
                  },
                  child: Image.asset("assets/images/car_right.png"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Lgn()));
  }
}
