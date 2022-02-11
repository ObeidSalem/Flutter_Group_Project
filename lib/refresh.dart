import 'dart:html';

import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'DatabaseManager.dart';
import 'package:firebase_database/firebase_database.dart';

class refresh extends StatefulWidget {
  @override
  _refreshState createState() => _refreshState();
}

class _refreshState extends State<refresh> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data from Database'),
        ),
        body: StreamBuilder(
            stream: collectionReference.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data!.docs
                      .map((e) => Column(
                            children: [
                              ListTile(
                                title: Text(e['post']),
                              ),
                              Divider(
                                color: Colors.black.withOpacity(0.6),
                                thickness: 2,
                              )
                            ],
                          ))
                      .toList(),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
