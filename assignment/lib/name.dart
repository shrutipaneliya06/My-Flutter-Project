import 'package:flutter/material.dart';

class name extends StatelessWidget {
  final String mainn;
  name(this.mainn);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        mainn,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
