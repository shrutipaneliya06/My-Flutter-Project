import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:masterskills/Screens/DetailSection/DetailedScreen.dart';
import 'package:masterskills/Services/DataController.dart';

import 'Account.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  List<DocumentSnapshot> snapshotData;
  bool isExcecuted = false;
  void clearText() {
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                DetailedScreen(),
                transition: Transition.downToUp,
                arguments: snapshotData[index],
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(snapshotData[index].data()['image']),
              ),
              title: Text(
                snapshotData[index].data()['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              subtitle: Text(
                snapshotData[index].data()['author'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
      );
    }

    return GetBuilder<DataController>(
        init: DataController(),
        builder: (val) {
          return Scaffold(
            drawer: Drawer(
              child: Account(),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  isExcecuted = false;
                });
              },
            ),
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              actions: [
                IconButton(
                  onPressed: () {
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExcecuted = true;
                      });
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ],
              title: TextField(
                textInputAction: TextInputAction.done,
                onTap: clearText,
                onSubmitted: ((Value) {
                  val.queryData(searchController.text).then((value) {
                    snapshotData = value;
                    setState(() {
                      isExcecuted = true;
                    });
                  });
                }),
                style: TextStyle(color: Colors.white, fontSize: 25),
                decoration: InputDecoration(
                    hintText: 'Search Courses',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 25)),
                controller: searchController,
              ),
            ),
            body: isExcecuted
                ? searchedData()
                : Container(
                    child: Center(
                      child: Image.asset(
                        'images/search.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
          );
        });
  }
}
