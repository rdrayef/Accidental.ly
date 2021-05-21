import 'package:accidenyally/accueil/menu.dart/menu.dart';
import 'package:accidenyally/changer-mot-sr-passe.dart';
import 'package:accidenyally/colors.dart';
import 'package:flutter/material.dart';

class Parametres extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[900],
          shadowColor: Colors.transparent,
          title: Text('Paramètres',
              style: TextStyle(
                  fontSize: 25,
                  backgroundColor: Colors.transparent,
                  color: Colors.white)),
          centerTitle: true,
          leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Accueil(),
                    ));
              }),
        ),
        body: SettingsPage(),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.16,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[900],
                //borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Column(
            children: [
              _buildContainer(
                  MediaQuery.of(context).size.height * 0.075,
                  MediaQuery.of(context).size.height * 0.7,
                  MediaQuery.of(context).size.width * 0.85),
            ],
          )
        ],
      ),
    );
  }
}

Widget _buildContainer(double mheight, double boxheight, double boxweight) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: mheight),
        height: boxheight,
        width: boxweight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[700],
              blurRadius: 5,
            ),
          ],
        ),
        child: ListView(
          children: <Widget>[
            switchclass(),
          ],
        ),
      ),
    ],
  );
}

class switchclass extends StatefulWidget {
  @override
  _switchclassState createState() => _switchclassState();
}

class _switchclassState extends State<switchclass> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 8),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.redAccent[700],
                size: 30,
              ),
              title: Text(
                "Termes et conditions",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 29,
                color: Colors.deepPurple[900],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _builddivider(),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.sync,
                color: Colors.redAccent[700],
                size: 30,
              ),
              title: Text(
                "Mise à jour",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 29,
                color: Colors.deepPurple[900],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _builddivider(),
            SizedBox(
              height: 15,
            ),
            ListTile(
                leading: Icon(
                  Icons.notifications_active,
                  color: Colors.redAccent[700],
                  size: 30,
                ),
                title: Text(
                  "Notifications",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                ),
                trailing: Switch(
                  onChanged: toggleSwitch,
                  value: isSwitched,
                  activeColor: Colors.grey[100],
                  activeTrackColor: bluecolor,
                  inactiveThumbColor: Colors.grey[100],
                  inactiveTrackColor: rougggecolor,
                )),
            SizedBox(
              height: 15,
            ),
            _builddivider(),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.flag,
                color: Colors.redAccent[700],
                size: 30,
              ),
              title: Text(
                "Langues",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 29,
                color: Colors.deepPurple[900],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _builddivider(),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.build,
                color: Colors.redAccent[700],
                size: 30,
              ),
              title: Text(
                "Types de services",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 29,
                color: Colors.deepPurple[900],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            /* _builddivider(),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.redAccent[700],
                size: 30,
              ),
              title: Text(
                "Partager",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 29,
                color: Colors.deepPurple[900],
              ),
            ),*/
            _builddivider(),
            SizedBox(
              height: 15,
            ),
            ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Colors.redAccent[700],
                  size: 30,
                ),
                title: Text(
                  " Mot de Passe",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    size: 29,
                    color: Colors.deepPurple[900],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Chpm()),
                    );
                  },
                )),
          ],
        ));
  }
}

Container _builddivider() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  );
}
