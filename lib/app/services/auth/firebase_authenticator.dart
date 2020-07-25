import 'package:firebase_auth/firebase_auth.dart';
import 'package:findme/app/models/user_model.dart';

class FirebaseAuthenticator {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthenticator({FirebaseAuth firebaseAuth})
      : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  User userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
    );
  }

  Future<void> providerSignIn() {
    throw UnimplementedError();
  }

  Stream<User> get onAuthStateChanged {
    return firebaseAuth.onAuthStateChanged.map(userFromFirebase);
  }

  Future<void> signOut() async {
    return firebaseAuth.signOut();
  }

  Future<User> currentUser() async {
    final user = await firebaseAuth.currentUser();
    return userFromFirebase(user);
  }
}
