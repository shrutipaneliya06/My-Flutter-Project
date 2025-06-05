import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class DataController extends GetxController {
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  // Future queryData(String queryString) async {
  //   return FirebaseFirestore.instance
  //       .collection('c++')
  //       .where('title', isGreaterThanOrEqualTo: queryString)
  //       .get();
  // }

  Future queryData(String queryString) async {
    QuerySnapshot response1 = await FirebaseFirestore.instance
        .collection("c")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    QuerySnapshot response2 = await FirebaseFirestore.instance
        .collection("c++")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    QuerySnapshot response3 = await FirebaseFirestore.instance
        .collection("css")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    QuerySnapshot response4 = await FirebaseFirestore.instance
        .collection("flutter")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    QuerySnapshot response5 = await FirebaseFirestore.instance
        .collection("html")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    QuerySnapshot response6 = await FirebaseFirestore.instance
        .collection("java")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    QuerySnapshot response7 = await FirebaseFirestore.instance
        .collection("javascript")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    QuerySnapshot response8 = await FirebaseFirestore.instance
        .collection("kotlin")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    QuerySnapshot response9 = await FirebaseFirestore.instance
        .collection("php")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    QuerySnapshot response10 = await FirebaseFirestore.instance
        .collection("python")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    QuerySnapshot response11 = await FirebaseFirestore.instance
        .collection("sql")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    QuerySnapshot response12 = await FirebaseFirestore.instance
        .collection("vbnet")
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
    List<QueryDocumentSnapshot> list1 = response1.docs;
    list1.addAll(response2.docs);
    list1.addAll(response3.docs);
    list1.addAll(response4.docs);
    list1.addAll(response5.docs);
    list1.addAll(response6.docs);
    list1.addAll(response7.docs);
    list1.addAll(response8.docs);
    list1.addAll(response9.docs);
    list1.addAll(response10.docs);
    list1.addAll(response11.docs);
    list1.addAll(response12.docs);

    print(list1);
    return list1;
  }
}
