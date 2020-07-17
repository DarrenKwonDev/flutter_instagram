import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com/constants/firebase_keys.dart';
import 'package:com/data/user.dart';
import 'package:com/firebase/transformer.dart';

class FirestoreProvider with Transformer {
  final Firestore _firestore = Firestore.instance;

  Future<void> attemptCreateuser({String userKey, String email}) async {
    final DocumentReference userRef =
        _firestore.collection(COLLECTION_USER).document(userKey);
    final DocumentSnapshot snapshot = await userRef.get();
    return _firestore.runTransaction((tx) async {
      if (!snapshot.exists) {
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

}

FirestoreProvider firestoreProvider = FirestoreProvider();
