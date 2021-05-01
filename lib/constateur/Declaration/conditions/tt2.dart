import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../colors.dart';

class Conditions extends StatefulWidget {
  @override
  _ConditionsState createState() => _ConditionsState();
}

class _ConditionsState extends State<Conditions> {
  List<bool> _itens = List();

  _loadingItens() {
    _itens = [];
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
    _itens.add(false);
  }

  @override
  void initState() {
    _loadingItens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: new StreamBuilder(
            stream: Streamdoc(context),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballPulse,
                      color: Colors.orange,
                    ),
                  ),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (_, index) {
                    print(snapshot.data.documents[index]['Libelle']);

                    return SizedBox(
                      width: double.maxFinite,
                      height: 100,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: bluecolor),
                              borderRadius: BorderRadius.circular(20),
                            ), //BoxDecoration

                            child: CheckboxListTile(
                              title: AutoSizeText(
                                  snapshot.data.documents[index]['Libelle']),
                              secondary: AutoSizeText(
                                snapshot.data.documents[index].documentID,
                                style: TextStyle(
                                    color: bluecolor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                              ),
                              autofocus: false,
                              activeColor: rougggecolor,
                              checkColor: Colors.white,
                              value: _itens[index],
                              onChanged: (bool value) {
                                setState(() {
                                  _itens[index] = value;
                                });
                              },
                            ), //CheckboxListTile
                          ), //Container
                        ), //Padding
                      ), //Center
                    );
                  });
            }));
  }

  Stream<QuerySnapshot> Streamdoc(BuildContext context) async* {
    yield* Firestore.instance.collection('conditions').snapshots();
  }
}
