import 'package:flutter/material.dart';

class AboutMaster extends StatefulWidget {
  const AboutMaster({Key key}) : super(key: key);

  @override
  State<AboutMaster> createState() => _AboutMasterState();
}

class _AboutMasterState extends State<AboutMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'About Master Skills',
          style: TextStyle(fontSize: 30),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Text(
            '\n\n Our Mission is to Teach Student Different Programming Language With Quiz. \n\n Us Develop Master Skill Because to Learn All Things in one. \n\n We provide all Service And Facality about Programming Language. \n\n ThankYou...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
