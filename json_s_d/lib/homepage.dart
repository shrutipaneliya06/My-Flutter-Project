import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_s_d/UserModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel userObject = new UserModel(
      id: "001",
      fullname: "shruti paneliya",
      email: "shrutipaneliya@gmail.com");
  String userJson =
      '{"id": "001","fullname":"shruti paneliya","email":"shrutipaneliya@gamil.com"}';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> userMap = userObject.toMap();
                  var json = jsonEncode(userMap);
                  print(json.toString());
                },
                child: Text('serialize')),
            SizedBox(width: 20),
            ElevatedButton(
                onPressed: () {
                  var decode = jsonDecode(userJson);
                  Map<String, dynamic> userMap = decode;
                  UserModel newUser = new UserModel.fromMap(userMap);
                  print(newUser.toString());
                  print(newUser.id.toString());
                  print(newUser.fullname.toString());
                  print(newUser.email.toString());
                },
                child: Text('De-serialize')),
          ],
        ),
      )),
    );
  }
}
