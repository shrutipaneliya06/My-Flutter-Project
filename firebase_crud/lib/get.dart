import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class seeNotes extends StatefulWidget {
  const seeNotes({super.key});

  @override
  State<seeNotes> createState() => _seeNotesState();
}

class _seeNotesState extends State<seeNotes> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  final Stream<QuerySnapshot> _notesStream = FirebaseFirestore.instance
      .collection('notes')
      .snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _notesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            data['id'] = document.id;
            CollectionReference notes =
                FirebaseFirestore.instance.collection('notes');
            Future<void> deleteNotes(id) {
              return notes
                  .doc(id)
                  .delete()
                  .then((value) => print("User Deleted"))
                  .catchError(
                      (error) => print("Failed to delete user: $error"));
            }

            Future updateNotes(id) {
              return notes
                  .doc(id)
                  .update(
                      {'title': title.text, 'description': description.text})
                  .then((value) => print('Updated'))
                  .catchError((error) => print('Failed To Upadate Notes'));
            }

            Future<Future> _showDialog() async {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Update Notes'),
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
                                    updateNotes(document.id);
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

            return SingleChildScrollView(
              child: Card(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        (data['title']),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          _showDialog();
                          setState(() {});
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            deleteNotes(document.id);
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                  Text(
                    (data['description']),
                  ),
                ],
              )),
            );
          }).toList(),
        );
      },
    );
  }
}
