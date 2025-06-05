import 'dart:convert';

import 'package:api/model.dart';
import 'package:api/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'update.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<Notes> notes = [];

  @override
  void initState() {
    super.initState();

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMyDialog(context).then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
      body:
          //  RefreshIndicator(
          //   onRefresh: () async {
          //     FutureBuilder(
          //       future: getData(),
          //       builder: (context, snapshot) {
          //         return Container();
          //       },
          //     );
          //   },
          //   child:
          FutureBuilder<List<Notes>?>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slidable(
                      startActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: ((context) {
                              showDialog(
                                context: context,
                                builder: (_) =>
                                    update(notes: snapshot.data![index]),
                              ).then((value) {
                                setState(() {});
                              });
                              // setState(() {
                              //   showDialog(
                              //     context: context,
                              //     builder: (_) =>
                              //         update(notes: snapshot.data![index]),
                              //   );
                              // });
                              // setState(() {});
                            }),
                            icon: Icons.edit,
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: ((context) {
                              print('object');
                              deleteData(notes[index].id)
                                  .then((value) => setState(() {}));
                              // setState(() {
                              //   // getData();
                              // });
                            }),
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: Container(
                        height: 100,
                        // height: MediaQuery.of(context).size.height / 5,
                        color: Colors.purpleAccent[400],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Id : ${notes[index].id}',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Title : ${notes[index].title}',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Description : ${notes[index].description}',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        },
        // ),
      ),
    );
  }

  Future<List<Notes>?> getData() async {
    print("Called");
    try {
      final response =
          await http.get(Uri.parse('http://192.168.29.191:8080/v1/notes'));
      // await http.get(Uri.parse('http://192.168.0.104:8080/v1/notes'));
      // await http.get(Uri.parse('http://192.168.15.28:8080/v1/notes'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        // for (Map<String, dynamic> index in data) {
        //   notes.add(Notes.fromJson(index));
        // }
        // setState(() {});
        final list = data as List;
        notes = list.map((e) => Notes.fromJson(e)).toList();

        return notes;
      }
    } catch (e) {
      return notes;
    }
  }

  Future<List<Notes>?> postData() async {
    print("Called");
    try {
      final response = await http.post(
          Uri.parse('http://192.168.29.191:8080/v1/notes'),
          body: jsonEncode({
            "title": titleController.text,
            "description": descriptionController.text
          }));
      // office
      // await http.post(Uri.parse('http://192.168.0.104:8080/v1/notes'));
      // home
      // await http.post(Uri.parse('http://192.168.15.28:8080/v1/notes'),
      //     body: jsonEncode({
      //       "title": titleController.text,
      //       "description": descriptionController.text
      //     }));
      // mine
      // var data = jsonEncode(response.body);
      if (response.statusCode == 201) {
        // notes.add(Notes.fromJson(jsonDecode(response.body)));
        // print(jsonDecode(response.body));
        // return notes;
      }
    } catch (e) {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Notes>?> deleteData(String id) async {
    try {
      final response = await http
          .delete(Uri.parse("http://192.168.29.191:8080/v1/notes/$id"));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$id')));
      }
    } catch (e) {
      throw Exception('Failed to load album');
    }
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Flexible(
          child: AlertDialog(
            title: const Text('Add Notes'),
            content: SizedBox(
              height: 140,
              width: 200,
              child: Flexible(
                child: SingleChildScrollView(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Flexible(
                        child: TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            hintText: 'Enter title',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Enter Description',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      postData();
                      Navigator.pop(context);
                      titleController.clear();
                      descriptionController.clear();
                    });
                  },
                  child: const Text('Add'))
            ],
          ),
        );
      },
    );
  }

  // Future<void> _updateMyDialog(BuildContext context) async {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Flexible(
  //         child: AlertDialog(
  //           title: const Text('Update Notes'),
  //           content: SizedBox(
  //             height: 140,
  //             width: 200,
  //             child: Flexible(
  //               child: SingleChildScrollView(
  //                 child: ListView(
  //                   shrinkWrap: true,
  //                   children: [
  //                     Flexible(
  //                       child: TextFormField(
  //                         controller: titleController,
  //                         decoration: const InputDecoration(
  //                           hintText: 'Enter title',
  //                           border: OutlineInputBorder(),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 20,
  //                     ),
  //                     Flexible(
  //                       child: TextFormField(
  //                         controller: descriptionController,
  //                         decoration: const InputDecoration(
  //                           hintText: 'Enter Description',
  //                           border: OutlineInputBorder(),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text('Cancel')),
  //             TextButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     title = titleController.text;
  //                     description = descriptionController.text;
  //                     // updateData();
  //                     Navigator.pop(context);
  //                     titleController.clear();
  //                     descriptionController.clear();
  //                   });
  //                 },
  //                 child: const Text('Add'))
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
