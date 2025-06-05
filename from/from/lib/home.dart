import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:from/value.dart';
import 'package:email_validator/email_validator.dart';

enum gender { male, female, other }

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  void clear() {
    name.clear();
    email.clear();
    phone.clear();
    address.clear();
    pin.clear();
    setState(() {
      g = null;
      for (var i = 0; i < tit.length; i++) {
        tit[i].value = false;
      }
    });
  }

  var tit = [
    checkstate(title: 'play', value: false),
    checkstate(title: 'sleep', value: false),
    checkstate(title: 'read', value: false)
  ];

  List<String> list = [];
  String? le;
  gender? g;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController check = TextEditingController();

  String? get errorText {
    // final text = _controller.value.text;

    if (email.text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (!RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
        .hasMatch(email.text)) {
      return 'Please enter a valid Email';
    }
    return null;
  }

  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('from'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'name :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: name,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          errorText: validate ? 'Can\'t be empty' : null,
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Email :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          errorText: errorText, border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'phone :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: phone,
                      decoration: InputDecoration(
                          errorText: validate ? 'Can\'t be empty' : null,
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Address :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: address,
                      decoration: InputDecoration(
                          errorText: validate ? 'Can\'t be empty' : null,
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'pin :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: pin,
                      decoration: InputDecoration(
                          errorText: validate ? 'Can\'t be empty' : null,
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: const [
                  Text(
                    'hobbies :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [...tit.map(singleCheck).toList()],
              ),
            ),
            Row(
              children: [
                const Text(
                  'Gender :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      value: gender.male,
                      groupValue: g,
                      title: const Text('male'),
                      onChanged: ((value) {
                        setState(() {
                          g = value;
                        });
                      })),
                ),
                Flexible(
                  child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      value: gender.female,
                      groupValue: g,
                      title: const Text('female'),
                      onChanged: ((value) {
                        setState(() {
                          g = value;
                        });
                      })),
                ),
                Flexible(
                  child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      value: gender.other,
                      // dense: true,
                      groupValue: g,
                      title: const Text('other'),
                      onChanged: ((value) {
                        setState(() {
                          g = value;
                        });
                      })),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        name.text.isEmpty ? validate = true : validate = false;
                        email.text.isEmpty ? validate = true : validate = false;
                        phone.text.isEmpty ? validate = true : validate = false;
                        address.text.isEmpty
                            ? validate = true
                            : validate = false;
                        pin.text.isEmpty ? validate = true : validate = false;
                      });
                      // for (var i = 0; i < tit.length; i++) {
                      //   if (tit[i].value == true) {
                      //     // var le = Text(tit[i].title);
                      //     String le = tit[i].title;
                      //     print('lol :$le');
                      //     // tit[i].title;
                      //     // print(tit[i].title);
                      //   }
                      // }
                      if (validate == false) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => valuee(
                                      name1: name.text,
                                      email1: email.text,
                                      phone1: phone.text,
                                      address1: address.text,
                                      pin1: pin.text,
                                      check1: list.toString(),
                                      radio1: g.toString(),
                                    )));
                      } else {
                        Null;
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: MaterialButton(
                    onPressed: () {
                      clear();
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget singleCheck(checkstate checkbox) => Flexible(
        child: CheckboxListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(checkbox.title),
            value: checkbox.value,
            onChanged: ((value) {
              setState(() {
                checkbox.value = value!;
                if (checkbox.value == true) {
                  list.add(checkbox.title);
                } else {
                  list.remove(checkbox.title);
                }
                // print(value);
              });
            })),
      );
}
