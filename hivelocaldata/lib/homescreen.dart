// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:hivelocaldata/boxes/boxes.dart';
import 'package:hivelocaldata/models/notes_models.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hive Database')),
      body: ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<NotesModel>();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            data[index].title.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: (() {
                                setState(() {
                                  _editDialog(
                                      data[index],
                                      data[index].title.toString(),
                                      data[index].description.toString());
                                });
                              }),
                              child: const Icon(Icons.edit)),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: (() {
                              setState(() {
                                delete(data[index]);
                              });
                            }),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        data[index].description.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _shoeMyDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _shoeMyDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
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
                    final data = NotesModel(
                        title: titleController.text,
                        description: descriptionController.text);
                    final box = boxes.getData();
                    box.add(data);
                    data.save();
                    titleController.clear();
                    descriptionController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text('Add'))
            ],
          ),
        );
      },
    );
  }

  Future<void> _editDialog(
      NotesModel notesModel, String title, String description) async {
    titleController.text = title;
    descriptionController.text = description;
    return showDialog(
        context: context,
        builder: (context) {
          return Flexible(
            child: AlertDialog(
              title: const Text('Edit Notes'),
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
                      notesModel.title = titleController.text;
                      notesModel.description = descriptionController.text;
                      notesModel.save();
                      titleController.clear();
                      descriptionController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Edit'))
              ],
            ),
          );
        });
  }

  void delete(NotesModel notesModel) async {
    await notesModel.delete();
  }
}
