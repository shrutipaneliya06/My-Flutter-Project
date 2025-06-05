import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;

import 'model.dart';

class update extends StatefulWidget {
  Notes notes;
  update({super.key, required this.notes});

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void restart() async {}

  List<Notes> notes = [];

  @override
  void initState() {
    titleController.text = widget.notes.title;
    descriptionController.text = widget.notes.description;
    print(widget.notes.toJson());
    super.initState();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Notes'),
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
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            updateData();
            setState(() {
              Navigator.pop(context);
              updateData();
            });
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  // Future<List<Notes>?> getData() async {
  //   print("Called");
  //   try {
  //     final response =
  //         await http.get(Uri.parse('http://192.168.29.191:8080/v1/notes'));
  //     // await http.get(Uri.parse('http://192.168.0.104:8080/v1/notes'));
  //     // await http.get(Uri.parse('http://192.168.15.28:8080/v1/notes'));
  //     var data = jsonDecode(response.body.toString());
  //     if (response.statusCode == 200) {
  //       // setState(() {
  //       //   for (Map<String, dynamic> index in data) {
  //       //     notes.add(Notes.fromJson(index));
  //       //   }
  //       // });
  //       for (Map<String, dynamic> index in data) {
  //         notes.add(Notes.fromJson(index));
  //       }
  //       // setState(() {});

  //       return notes;
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load album');
  //   }
  // }

  Future<List<Notes>?> updateData() async {
    try {
      final response = await http.patch(
        Uri.parse("http://192.168.29.191:8080/v1/notes/${widget.notes.id}"),
        body: jsonEncode(<String, dynamic>{
          "title": titleController.text,
          "description": descriptionController.text
        }),
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      throw Exception('Failed to load album');
    }
  }
}
