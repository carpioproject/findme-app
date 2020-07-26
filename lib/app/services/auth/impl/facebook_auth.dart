import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:findme/app/services/auth/firebase_authenticator.dart';

class FacebookAuthenticator extends FirebaseAuthenticator {
  FacebookAuth _facebookAuth;

  FacebookAuthenticator({FirebaseAuth firebaseAuth, FacebookAuth facebookAuth})
      : _facebookAuth = facebookAuth ?? FacebookAuth.instance,
        super(firebaseAuth: firebaseAuth);

  @override
  void providerSignIn() async {
    // if (await _googleSignIn.isSignedIn()) {
    //   return await super.firebaseAuth.currentUser();
    // }
    final facebookLogin = await _facebookAuth.login();
    final AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: facebookLogin.accessToken.token);

    await super.firebaseAuth.signInWithCredential(credential);
  }
}
