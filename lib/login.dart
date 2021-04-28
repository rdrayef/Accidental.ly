import 'package:accidenyally/colors.dart';
import 'package:accidenyally/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'inscription.dart';

class Lgn extends StatefulWidget {
  @override
  _LgnState createState() => _LgnState();
}

class _LgnState extends State<Lgn> {
  void initState() {
    super.initState();
  }

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();
  String _error;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  bool _obscureText = true;
  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.indigo[900], Colors.indigo[900]]),
        ),
        child: Column(
          children: <Widget>[
            Showerror(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
              ),
              child: Image.asset(
                'assets/images/Groupe 66.png',
                height: 300,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 30,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextFormField(
                                    controller: _emailcontroller,
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      hintText: "exemple@gmail.com",
                                      suffixIcon: Icon(
                                        Icons.mail_sharp,
                                        color: bluecolor,
                                      ),
                                      hintStyle:
                                          TextStyle(color: Colors.black12),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "*Champ requis"),
                                      EmailValidator(
                                          errorText: "Entrer un email valide"),
                                    ]),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo[900]))),
                                  child: TextFormField(
                                    controller: _passwordcontroller,
                                    obscureText: _obscureText,
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "*Champ requis"),
                                    ]),
                                    decoration: InputDecoration(
                                      labelText: "Mot de passe",
                                      hintStyle: TextStyle(color: Colors.black),
                                      labelStyle: TextStyle(color: Colors.grey),
                                      suffixIcon: InkWell(
                                        onTap: _togglePasswordView,
                                        child: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: bluecolor,
                                        ),
                                      ),
                                    ),
                                    /*    validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Remplir le champ';
                                        }
                                        return null;
                                      } */
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 50),
                                  child: Container(
                                    child: SizedBox(
                                      height: 45,
                                      width: 180,
                                      child: RaisedButton(
                                        color: bluecolor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            try {
                                              FirebaseUser user =
                                                  await FirebaseAuth
                                                      .instance
                                                      .signInWithEmailAndPassword(
                                                          email:
                                                              _emailcontroller
                                                                  .text,
                                                          password:
                                                              _passwordcontroller
                                                                  .text);
                                              if (user != null) {
                                                print('Welcome');
                                                print(
                                                    "==================================");
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home(
                                                              user: user,
                                                            )));
                                              } else {
                                                print('user not found');
                                              }
                                            } catch (e) {
                                              setState(() {
                                                _error = e.message;
                                              });
                                              print(e);
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 8),
                                  child: FlatButton(
                                    onPressed: (null),
                                    child: Text(
                                      "Mot de passe oublié?",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Inscription(),
                                            ));
                                      },
                                      child: Text(
                                        "Créer un nouveau compte",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 19,
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Showerror() {
    if (_error != null) {
      return Container(
        margin: EdgeInsets.only(top: 15),
        width: double.infinity,
        color: Colors.red,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.error_outline,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: AutoSizeText(
                _error,
                maxLines: 3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: IconButton(
                icon: Icon(
                  Icons.close_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }
}
