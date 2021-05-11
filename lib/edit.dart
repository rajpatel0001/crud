import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  DocumentSnapshot docEdit;

  Edit({this.docEdit});
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();

  @override
  void initState() {
    name = TextEditingController(text: widget.docEdit.data()['name']);
    location = TextEditingController(text: widget.docEdit.data()['location']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                widget.docEdit.reference.update({
                  'name': name.text,
                  'location': location.text
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 20),
              )),
          FlatButton(
              onPressed: () {
                widget.docEdit.reference
                    .delete()
                    .whenComplete(() => Navigator.pop(context));
              },
              child: Text(
                "Delete",
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
