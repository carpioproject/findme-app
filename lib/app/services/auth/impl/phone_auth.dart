import 'package:flutter/material.dart';
import 'package:findme/ui/components/auth/modal_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:findme/app/services/auth/firebase_authenticator.dart';

class PhoneAuthenticator extends FirebaseAuthenticator {
  final BuildContext _context;

  PhoneAuthenticator({FirebaseAuth firebaseAuth, BuildContext context})
      : _context = context,
        super(firebaseAuth: firebaseAuth);

  @override
  void providerSignIn() {
    //Call to the phone number modal
    ModalComponent(
            title: 'Sign in with Phone Number',
            child: _buildPhoneNumberForm(),
            context: _context)
        .showModal();
  }

  Future<void> verifyPhoneNumber({String phoneNumber}) async {
    await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          await super.firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (AuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) async {
          ModalComponent(
                  title: 'Introduce the code we sent you',
                  child: _buildConfirmationCode(verificationId: verificationId),
                  context: _context)
              .showModal();
        },
        codeAutoRetrievalTimeout: null);
  }

  Widget _buildConfirmationCode({String verificationId}) {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Expanded(
          child: TextFormField(
            validator: (String value) {
              if (value.length != 6) {
                return 'This is not a valid number';
              }
            },
            onSaved: (String value) async {
              AuthCredential credential = PhoneAuthProvider.getCredential(
                  verificationId: verificationId, smsCode: value);

              await super.firebaseAuth.signInWithCredential(credential);
              ModalComponent.instance.closeModal();
            },
            decoration: InputDecoration(hintText: 'Phone Number with prefix'),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          height: 48.0,
          width: double.infinity,
          child: FlatButton(
            child: Text('Validate'),
            textColor: Colors.white,
            padding: EdgeInsets.all(16),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                print('Form was validated');
                _formKey.currentState.save();
              }
            },
            color: Colors.blue,
          ),
        )
      ]),
    );
  }

  Widget _buildPhoneNumberForm() {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Expanded(
          child: TextFormField(
            validator: (String value) {
              if (!RegExp(r"([+]?\d{1,2}[.-\s]?)?(\d{3}[.-]?){2}\d{4}")
                  .hasMatch(value)) {
                return 'This is not a valid number';
              }
            },
            onSaved: (String value) {
              ModalComponent.instance.closeModal();
              verifyPhoneNumber(phoneNumber: value);
            },
            decoration: InputDecoration(hintText: 'Phone Number with prefix'),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          height: 48.0,
          width: double.infinity,
          child: FlatButton(
            child: Text('Validate'),
            textColor: Colors.white,
            padding: EdgeInsets.all(16),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                print('Form was validated');
                _formKey.currentState.save();
              }
            },
            color: Colors.blue,
          ),
        )
      ]),
    );
  }
}
