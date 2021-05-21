import 'package:accidenyally/colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'degats.dart';

class Emplacement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Spatio-temporel",
              style: TextStyle(
                  color: bluecolor, fontSize: 23, fontWeight: FontWeight.w600)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.person_pin_circle_rounded,
              size: 30,
              color: rougggecolor,
            ),
            onPressed: () {},
          )),
      body: Emplacements(),
    );
  }
}

class Emplacements extends StatefulWidget {
  @override
  _EmplacementsState createState() => _EmplacementsState();
}

class _EmplacementsState extends State<Emplacements> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress = "";
  TextEditingController _adr = TextEditingController();
  TextEditingController _heure = TextEditingController();
  TextEditingController _date = TextEditingController();
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.subThoroughfare},${place.thoroughfare}, ${place.locality},${place.administrativeArea}, ${place.country}";
        print(_currentAddress);
        setState(() {
          _adr.text = _currentAddress;
          loading = false;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
    _heure.text = _time.format(context);
  }

  @override
  Widget build(BuildContext context) {
    Size devwidth = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          child: Image.asset("assets/images/pin.gif"),
        ),
        Container(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 10.0,
                        color: blufanccolor.withOpacity(0.5),
                      ),
                    ],
                  ),
                  width: devwidth.width * 0.8,
                  child: TextField(
                    controller: _adr,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    readOnly: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                      suffixIcon: loading
                          ? Center(child: CircularProgressIndicator())
                          : IconButton(
                              icon: Icon(
                                Icons.gps_fixed,
                                color: bluecolor,
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  loading = true;
                                  _getCurrentLocation();
                                });
                              },
                            ),
                      hintText: 'Endroit d\'accident....',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: blufanccolor.withOpacity(0.1)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: devwidth.height * 0.03),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 10.0,
                      color: blufanccolor.withOpacity(0.5),
                    ),
                  ],
                ),
                width: devwidth.width * 0.67,
                child: TextField(
                  controller: _date,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  readOnly: true,
                  autocorrect: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        _date.text = date.toString().substring(0, 10);
                      },
                      icon: Icon(
                        Icons.calendar_today,
                        color: bluecolor,
                      ),
                    ),
                    hintText: 'Date d\'accident....',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                          BorderSide(color: blufanccolor.withOpacity(0.1)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: devwidth.height * 0.03),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 10.0,
                      color: blufanccolor.withOpacity(0.5),
                    ),
                  ],
                ),
                width: devwidth.width * 0.63,
                child: TextField(
                  controller: _heure,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  readOnly: true,
                  autocorrect: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.alarm, size: 30),
                      color: bluecolor,
                      onPressed: () {
                        _selectTime();
                      },
                    ),
                    hintText: 'Heure d\'accident....',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                          BorderSide(color: blufanccolor.withOpacity(0.1)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: devwidth.width / 1.6,
              right: devwidth.width * 0.045,
              top: devwidth.height * 0.05),
          child: SizedBox(
              height: 50,
              width: 120,
              child: RaisedButton(
                color: bluecolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Degats()));
                },
                child: Icon(
                  Icons.trending_flat_rounded,
                  color: Colors.white,
                  size: 45,
                ),
              )),
        ),
      ],
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    toggleableActiveColor: shrinePink400,
    accentColor: shrineBrown900,
    primaryColor: shrinePink100,
    buttonColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    textSelectionColor: shrinePink100,
    errorColor: shrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink400,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
