import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(shared());
}

class shared extends StatefulWidget {
  const shared({super.key});

  @override
  State<shared> createState() => _sharedState();
}

class _sharedState extends State<shared> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
  }

  @override
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shared'),
      ),
      body: Column(
        children: [
          Flexible(
            child: TextField(
              controller: name,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          MaterialButton(
              child: Text('save'),
              onPressed: (() {
                setState(() {
                  setData(name.text);
                });
              })),
          MaterialButton(
            child: Text('show notes'),
            onPressed: () {
              setState(() {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => share()));
              });
            },
          )
        ],
      ),
    );
  }

  Future<void> setData(set) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', set);
  }
}
