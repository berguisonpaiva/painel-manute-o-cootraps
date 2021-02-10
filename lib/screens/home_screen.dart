import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          RaisedButton(
            onPressed: () {},
            child: Center(
              child: Text('Home'),
            ),
            color: Colors.transparent,
          ),
          RaisedButton(
            onPressed: () {},
            child: Center(
              child: Text('Sign out'),
            ),
            color: Colors.transparent,
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('portariaG1')
            .where('dataSaida', isEqualTo: '')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('erro ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return SizedBox(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.none:
              return Text('não tem');
            case ConnectionState.done:
              return Text('não 555 tem');
            default:
              return ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return ListTile();
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
