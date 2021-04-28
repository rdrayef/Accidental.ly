import 'package:accidenyally/main.dart';
import 'package:flutter/material.dart';

class Homme extends StatelessWidget {
  const Homme({Key key}) : super(key: key);

  static final linearTween = Tween<double>(begin: 0, end: 1);

  static final tweenSequence = TweenSequence(
    <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 40.0,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(1.0),
        weight: 20.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.0, end: 0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 40.0,
      ),
    ],
  );

  static final Tween<double> chainTween = Tween<double>(begin: 0, end: 2);

  static final constantTween = ConstantTween<double>(1.0);

  static final Curve sawToothCurve = SawTooth(7);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 210),
          child: Container(
            child: PageView(
              children: <Widget>[
                AnimationAndCurveDemo(
                  mainCurve: linearTween
                      .chain(CurveTween(curve: Curves.easeIn))
                      .chain(CurveTween(curve: Curves.easeOut)),
                  duration: Duration(seconds: 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum KindOfAnimation {
  forward,
  repeat,
  repeatAndreverse,
}

class Animatiocar extends StatefulWidget {
  final Animatable<double> mainCurve;
  final Animatable<double> compareCurve;
  final String lable;
  final double size;
  final Duration duration;
  final KindOfAnimation kindOfAnim;
  Animatiocar({
    Key key,
    @required this.mainCurve,
    this.compareCurve,
    this.lable = '',
    this.size = 2000,
    this.duration = const Duration(seconds: 1),
    this.kindOfAnim = KindOfAnimation.forward,
  })  : assert(size != null &&
            duration != null &&
            mainCurve != null &&
            kindOfAnim != null),
        super(key: key);
  @override
  _AnimatiocarState createState() => _AnimatiocarState();
}

class _AnimatiocarState extends State<Animatiocar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
