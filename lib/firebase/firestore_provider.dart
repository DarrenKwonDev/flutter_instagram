import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  // 데이터를 보냅니다.
  Future<void> sendData() {
    return Firestore.instance
        .collection('User')
        .document()
        .setData({"email": "dev@email.com", "author": "author"});
  }

  // 데이터 페칭
  Stream<dynamic> getData() {
    Firestore.instance
        .collection("User")
        .document("kKRMo03tcuBShmU24H9K")
        .get()
        .then((DocumentSnapshot ds) {
      print(ds.data);
    });
  }
}

FirestoreProvider firestoreProvider = FirestoreProvider();