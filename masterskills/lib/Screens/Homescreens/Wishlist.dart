import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:masterskills/Screens/DetailSection/DetailedScreen.dart';
import 'package:masterskills/Services/DataController.dart';

import 'Account.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Account(),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'WishList',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: GetBuilder<DataController>(
        init: DataController(),
        builder: (Value) {
          return FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('user')
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .collection('wishlist')
                  .get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                if (FirebaseAuth.instance.currentUser.uid == null) {
                  return Center(
                    child: Image.asset(
                      'images/wishlist.png',
                      width: 250,
                    ),
                  );
                } else {
                  if (snapshot.data.docs.length == 0) {
                    return Center(
                      child: Image.asset(
                        'images/wishlist.png',
                        width: 250,
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new ListView.separated(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              DetailedScreen(),
                              transition: Transition.fade,
                              arguments: snapshot.data.docs[index],
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 100.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(snapshot
                                                  .data.docs[index]
                                                  .data()['image']),
                                              fit: BoxFit.contain),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 300.0),
                                        child: Text(
                                          snapshot.data.docs[index]
                                              .data()['title'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        snapshot.data.docs[index]
                                            .data()['author'],
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
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
                                          Text(
                                            snapshot.data.docs[index]
                                                .data()['ratings'],
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16.0),
                                          ),
                                          Text(
                                            ('(${snapshot.data.docs[index].data()['enrolled']})'),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16.0),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30.0),
                                            child: InkWell(
                                              onTap: (() async {
                                                print('delete');
                                                await delete(snapshot
                                                    .data.docs[index].id);
                                                setState(() {});
                                              }),
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                    ),
                  );
                }
              });
        },
      ),
    );
  }

  Future<void> delete(id) async {
    FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('wishlist')
        .doc(id)
        .delete();

    Fluttertoast.showToast(msg: 'Deleted');
  }

  // Future<QuerySnapshot> getData() async {
  //   String userId = FirebaseAuth.instance.currentUser.uid;
  //   print(userId);
  //   await FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(userId)
  //       .collection('wishlist')
  //       .get()
  //       .then((value) => print(value.docs));

  //   return FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(userId)
  //       .collection('wishlist')
  //       .get();
  // }
}
