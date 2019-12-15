import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseDatabase {
  Future insertUserData(String email, String password, String uid);
}

class Database extends BaseDatabase {
  @override
  Future insertUserData(String email, String password, String uid) async {
    final CollectionReference usersCollection =
        Firestore.instance.collection('users');
    await usersCollection
        .document(uid)
        .setData({'email': email, 'password': password, 'uid': uid});
  }
}
