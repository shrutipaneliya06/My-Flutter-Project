// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('yours')),
      body: Center(
          child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: 'yeah',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('image/Doraemon.jpeg'),
          ),
        ),
      )),
    );
  }
}
