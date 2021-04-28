import 'package:accidenyally/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Service extends StatelessWidget {
  singleCard(iconcode, icontitle) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: 130,
        height: 100,
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
                  size: 55,
                  color: Colors.deepPurple[700],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  icontitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: bluecolor,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: rougecolor,
                  size: 30,
                )
              ],
            ),
          ),
          shadowColor: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      width: 20,
                    ),
                    singleCard(Icons.home_work_outlined, 'Agences')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 120, vertical: 115),
                child: Padding(
                  child: singleCard(Icons.car_repair, 'Conseils de Sinistre'),
                  padding: EdgeInsets.all(10),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 265),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    singleCard(Icons.perm_phone_msg, 'Contact'),
                    SizedBox(
                      width: 20,
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
  }
}
