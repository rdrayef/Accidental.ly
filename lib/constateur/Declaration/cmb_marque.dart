import 'package:accidenyally/colors.dart';

/// Flutter code sample for DropdownButton

// This sample shows a `DropdownButton` with a large arrow icon,
// purple text style, and bold purple underline, whose value is one of "One",
// "Two", "Free", or "Four".
//

import 'package:flutter/material.dart';

/// This is the main application widget.
class drpdwn extends StatelessWidget {
  const drpdwn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyStatefulWidget(),
    );
  }
}

Item selectedUser;

List<Item> users = <Item>[
  const Item('Peugeot'),
  const Item('Renault'),
  const Item('Citroën'),
  const Item('Volkswagen'),
  const Item('Toyota'),
  const Item('Fiat'),
  const Item('Mercedes'),
  const Item('BMW'),
];

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white70,
      ),
      child: DropdownButton<Item>(
        dropdownColor: Colors.white,
        underline: Container(),
        hint: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(
                "Sélectionnez une marque",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.28,
            )
          ],
        ),
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: bluecolor,
        ),
        value: selectedUser,
        onChanged: (Item Value) {
          setState(() {
            selectedUser = Value;
          });
        },
        items: users.map((Item user) {
          return DropdownMenuItem<Item>(
            value: user,
            child: Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(
                user.name,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Item {
  const Item(this.name);
  final String name;
}
