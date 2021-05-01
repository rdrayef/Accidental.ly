import 'package:flutter/material.dart';

class Pdfv extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Colors.green[50],
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 3,
                        color: Colors.green[200],
                        child: Text('Vehicule 1  gggfgg'),
                      ),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 3,
                        color: Colors.green[200],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Seprator(),
                    CheckBox(
                      frenchText: 'ddfgfg fgf ghghghgh',
                      arabicText: 'ببل للل ااا تنمم',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    CheckBox(
                      frenchText: 'mmm mmmm mm mm m m ',
                      arabicText: 'ببل للل بيلبيل اللال',
                    ),
                    Seprator(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red[50],
                  child: Column(children: [
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 3,
                      color: Colors.red[200],
                      child: Text('Vehicule 1  gggfgg'),
                    ),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 3,
                      color: Colors.red[200],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CheckBox extends StatelessWidget {
  final String frenchText;
  final String arabicText;
  CheckBox({this.frenchText, this.arabicText});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              child: Icon(
                Icons.check_box_outline_blank,
                size: 13,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.green[200],
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(frenchText),
          ],
        ),
        Row(
          children: [
            Text(arabicText),
            SizedBox(
              width: 12,
            ),
            Container(
              height: 30,
              width: 30,
              child: Icon(
                Icons.check_box_outline_blank,
                size: 13,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.red[200],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Seprator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.green[200],
          ),
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.red[200],
          ),
        ),
      ],
    );
  }
}
