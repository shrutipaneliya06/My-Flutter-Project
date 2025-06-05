import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class share extends StatefulWidget {
  const share({super.key});

  @override
  State<share> createState() => _shareState();
}

class _shareState extends State<share> {
  String? nameValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('shared')),
      body: Center(child: nameValue == null ? Text('error') : Text(nameValue!)),
    );
  }

  void get() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    nameValue = preferences.getString('name');
    setState(() {});
  }
}
