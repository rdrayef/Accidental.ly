import 'package:accidenyally/colors.dart';
import 'package:flutter/material.dart';

class Servicesse extends StatefulWidget {
  @override
  _ServicessState createState() => _ServicessState();
}

class _ServicessState extends State<Servicesse> {
  @override
  Widget build(BuildContext context) {
    singleCard(iconcode, icontitle) {
      return GestureDetector(
        onTap: () => {},
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.245,
          child: Card(
            color: services_blue,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23.0),
            ),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    iconcode,
                    size: MediaQuery.of(context).size.width * 0.14,
                    color: Colors.deepPurple[700],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Text(
                    icontitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: bluecolor,
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.01,
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: rougecolor,
                      iconSize: MediaQuery.of(context).size.width * 0.07,
                      onPressed: () {
                        setState(
                          () {},
                        );
                      })
                ],
              ),
            ),
            shadowColor: Colors.grey[600],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Container(
            child: Stack(children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    singleCard(Icons.support_agent_rounded, 'Assistance'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    singleCard(Icons.home_work_outlined, 'Agences')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.26,
                    vertical: MediaQuery.of(context).size.height * 0.155),
                child: Padding(
                  child: singleCard(Icons.car_repair, 'Conseils'),
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: MediaQuery.of(context).size.height * 0.365),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    singleCard(Icons.perm_phone_msg, 'Contact'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    singleCard(Icons.question_answer_rounded, 'FAQ')
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
    ;
  }
}
