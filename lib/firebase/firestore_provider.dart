import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com/constants/firebase_keys.dart';
import 'package:com/data/user.dart';
import 'package:com/firebase/transformer.dart';

class FirestoreProvider with Transformer {
  final Firestore _firestore = Firestore.instance;

  Future<void> attemptCreateuser({String userKey, String email}) {
    final DocumentReference userRef =
        _firestore.collection(COLLECTION_USER).document(userKey);
    return _firestore.runTransaction((tx) async {
      DocumentSnapshot snapshot = await tx.get(userRef);
      if (snapshot.exists) {
        // 이미 유저가 존재하는 경우
        return;
      } else {
        // db에 유저가 없으니 생성
        await tx.set(userRef, User.getMapForCreateUser(email));
      }
    });
  }

  Stream<User> connectMyUserData(String userKey) {
    return _firestore
        .collection(COLLECTION_USER)
        .document(userKey)
        .snapshots()
        .transform(toUser);
  }

  Stream<List<User>> fetchAllUsers() {
    // 콜렉션 전체를 가져옵니다.
    return _firestore.collection(COLLECTION_USER).snapshots().transform(toUsers);
  }

  Stream<List<User>> fetchAllUsersExceptMine() {
    // 콜렉션 전체를 가져옵니다.
    return _firestore.collection(COLLECTION_USER).snapshots().transform(toUsersExceptMine);
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
