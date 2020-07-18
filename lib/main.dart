import 'package:flutter/material.dart';
import 'package:searchfeature/cloud_firestore.dart';
import 'package:searchfeature/searchDeligate.dart';

import 'localSearch.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Feature"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text("using cloud firestore"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return CloudFirestoreSearch();
              }));
            },
          ),
          RaisedButton(
            child: Text("Using SearchDeliate"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return SearchAppBarDelegate();
              }));
            },
          ),
          RaisedButton(
            child: Text("uisng local search"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return LocalSearch();
              }));
            },
          ),
        ],
      ),
    );
  }
}
