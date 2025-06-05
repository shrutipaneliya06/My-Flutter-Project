import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/get.dart';
import 'package:flutter/material.dart';

class crud extends StatefulWidget {
  const crud({super.key});

  @override
  State<crud> createState() => _crudState();
}

class _crudState extends State<crud> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  // final Stream<QuerySnapshot<Map<String, dynamic>>> get =
  //     FirebaseFirestore.instance.collection('notes').snapshots();

  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future<void> addNotes() async {
    return await notes
        .doc()
        .set({
          'title': title.text, // John Doe
          'description': description.text, // Stokes and Sons
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notes'),
      ),
      body: seeNotes(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Future> _showDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Notes'),
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                      hintText: 'Enter Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: description,
                    decoration: InputDecoration(
                      hintText: 'Enter Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          title.clear();
                          description.clear();
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: (() {
                          addNotes();
                          title.clear();
                          description.clear();
                          Navigator.pop(context);
                        }),
                        child: Text('Add'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
