// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection("notes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                ref.add({
                  'name': name.text,
                  'location': location.text
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: name,
                decoration: InputDecoration(hintText: "Name"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: location,
                decoration: InputDecoration(hintText: "Location"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
