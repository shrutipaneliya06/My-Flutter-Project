import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masterskills/Screens/DetailSection/DetailedScreen.dart';
import 'package:masterskills/Services/DataController.dart';

import 'Account.dart';

class Featured extends StatefulWidget {
  const Featured({Key key}) : super(key: key);

  @override
  State<Featured> createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: Account(),
      ),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.star))],
        //  Icon(Icons.star),
        backgroundColor: Colors.black,
        title: Text(
          'Features',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.0,
              width: 400.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage('images/home.png'))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Tutorials',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return new FutureBuilder(
                    future: Value.getData('c'),
                    // ignore: missing_return
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: new Text('Error ${snapshot.error}'),
                        );
                      } else if (snapshot.hasData) {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        snapshot.data[index].data()['title'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        snapshot.data[index].data()['author'],
                                        style: TextStyle(color: Colors.grey),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(EvaIcons.star,
                                            color: Colors.yellowAccent),
                                        Icon(EvaIcons.star,
                                            color: Colors.yellowAccent),
                                        Icon(EvaIcons.star,
                                            color: Colors.yellowAccent),
                                        Icon(EvaIcons.star,
                                            color: Colors.yellowAccent),
                                        Icon(EvaIcons.star,
                                            color: Colors.yellowAccent),
                                        // Text(
                                        //   snapshot.data[index]
                                        //       .data()['ratings'],
                                        //   style: TextStyle(
                                        //       color: Colors.grey,
                                        //       fontSize: 16.0),
                                        // ),
                                        // Text(
                                        //   ('(${snapshot.data[index].data()['enrolled']})'),
                                        //   style: TextStyle(
                                        //       color: Colors.grey,
                                        //       fontSize: 16.0),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return FutureBuilder(
                    future: Value.getData('c++'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['author'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        // Text(
                                        //   snapshot.data[index]
                                        //       .data()['ratings'],
                                        //   style: TextStyle(
                                        //       color: Colors.grey,
                                        //       fontSize: 16.0),
                                        // ),
                                        // Text(
                                        //   ('(${snapshot.data[index].data()['enrolled']})'),
                                        //   style: TextStyle(
                                        //       color: Colors.grey,
                                        //       fontSize: 16.0),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return FutureBuilder(
                    future: Value.getData('java'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['author'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return FutureBuilder(
                    future: Value.getData('flutter'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['author'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return FutureBuilder(
                    future: Value.getData('python'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['author'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return FutureBuilder(
                    future: Value.getData('sql'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['author'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return FutureBuilder(
                    future: Value.getData('php'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['author'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return FutureBuilder(
                    future: Value.getData('vbnet'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['author'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return FutureBuilder(
                    future: Value.getData('html'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['author'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return FutureBuilder(
                    future: Value.getData('css'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['author'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return FutureBuilder(
                    future: Value.getData('javascript'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['author'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 250.0,
              width: 400.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (Value) {
                  return FutureBuilder(
                    future: Value.getData('kotlin'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailedScreen(),
                                  transition: Transition.leftToRight,
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.0,
                                      width: 200.0,
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 5,
                                        margin: EdgeInsets.all(10),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].data()['author'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                        Icon(
                                          EvaIcons.star,
                                          color: Colors.yellowAccent,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
