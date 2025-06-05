import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('name'),
        ),
        body: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'RUCHIT',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    textAlign: TextAlign.right,
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Expanded(
                  child: Text(
                    'RUCHIT',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'KRINA',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    textAlign: TextAlign.right,
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Expanded(
                  child: Text(
                    'KRINA',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
