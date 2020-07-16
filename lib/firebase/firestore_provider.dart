import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com/constants/firebase_keys.dart';
import 'package:com/data/user.dart';

class FirestoreProvider {
  final Firestore _firestore = Firestore.instance;

  Future<void> attemptCreateuser({String userKey, String email}) {
    final DocumentReference userRef =
        _firestore.collection(COLLECTION_USER).document(userKey);
    return _firestore.runTransaction((tx) async {
      DocumentSnapshot snapshot = await tx.get(userRef);
      if (snapshot.exists) {
        return;
      } else {
        await tx.set(userRef, User.getMapForCreateUser(email));
      }
    });
  }

//  // 데이터를 보냅니다.
//  Future<void> sendData() {
//    return Firestore.instance
//        .collection('User')
//        .document()
//        .setData({"email": "dev@email.com", "author": "author"});
//  }
//
//  // 데이터 페칭
//  Stream<dynamic> getData() {
//    Firestore.instance
//        .collection("User")
//        .document("kKRMo03tcuBShmU24H9K")
//        .get()
//        .then((DocumentSnapshot ds) {
//      print(ds.data);
//    });
//  }
}

FirestoreProvider firestoreProvider = FirestoreProvider();
