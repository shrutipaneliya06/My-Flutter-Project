import 'package:flutter/material.dart';

class tefi extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  tefi(this.nameController);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: 'enter :',
        ),
      ),
    );
  }
}
