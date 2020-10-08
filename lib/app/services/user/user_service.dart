import 'package:findme/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  static UserService _instance;
  CollectionReference _dbRef;
  User _user;

  UserService._internal({User user}) {
    _dbRef = Firestore.instance.collection('users');
    _user = user;
    _shouldRegisterUser(uid: user.uid);
  }

  factory UserService({User user}) {
    if (_instance == null) {
      _instance = UserService._internal(user: user);
    }

    return _instance;
  }

  _shouldRegisterUser({String uid}) async {
    DocumentSnapshot userSnapshot = await _dbRef.document(uid).get();

    if (userSnapshot.data == null) {
      await _dbRef.document(uid).setData(_user.toJson());
    }
  }
}
