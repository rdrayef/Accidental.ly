import 'package:accidenyally/colors.dart';
import 'package:accidenyally/constateur/Declaration/verification/Verification.dart';
import 'package:accidenyally/constateur/costateur_accueil.dart';
import 'package:accidenyally/constateur/profil/profille.dart';
import 'package:accidenyally/parametres.dart';
import 'package:accidenyally/services/body.dart';
import 'package:flutter/material.dart';

class Constateur extends StatefulWidget {
  @override
  _ConstateurState createState() => _ConstateurState();
}

class _ConstateurState extends State<Constateur> {
  int currentTab = 0;
  final List<Widget> screens = [Princi(), Content(), Parametres(), Prfl()];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Princi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: bluecolor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Tst(),
              ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: bluecolor,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Princi();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? rougecolor : Colors.white,
                        ),
                        Text(
                          'Accueil',
                          style: TextStyle(
                            color: currentTab == 0 ? rougecolor : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Content(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.call,
                          color: currentTab == 1 ? rougecolor : Colors.white,
                        ),
                        Text(
                          'service',
                          style: TextStyle(
                            color: currentTab == 1 ? rougecolor : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Prfl();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: currentTab == 2 ? rougecolor : Colors.white,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 2 ? rougecolor : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Parametres();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? rougecolor : Colors.white,
                        ),
                        Text(
                          'Parametre',
                          style: TextStyle(
                            color: currentTab == 3 ? rougecolor : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Appb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List items = ["2"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 125),
              height: 480,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(1), // ici *******
                    spreadRadius: 2,
                    blurRadius: 9,
                    offset: Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
              child: getbody(),
            ),
          ],
        )
      ],
    );
  }
}

class Princi extends StatefulWidget {
  @override
  _PrinciState createState() => _PrinciState();
}

class _PrinciState extends State<Princi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[900],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                      child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 20),
                        child: Text('23 , janvier 2021 ',
                            style: TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ],
                  )),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Text(
                              'Bienvenu,Sophia ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Container(
                            //  margin: const EdgeInsets.fromLTRB(20, 0.5, 0, 13),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(80 / 2),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://writestylesonline.com/wp-content/uploads/2016/08/Follow-These-Steps-for-a-Flawless-Professional-Profile-Picture.jpg")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Appb(),
        ],
      ),
    );
  }
}
/*********************************************** */
