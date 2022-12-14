// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/usermodel.dart';

class UserProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth;
  UserProvider(this.firebaseAuth);
  var firestore = FirebaseFirestore.instance;

  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authstatechanges => firebaseAuth.authStateChanges();

  bool _isRemembered = false;
  bool get isRemembered => _isRemembered;
  set isRemembered(bool value) {
    _isRemembered = value;
    notifyListeners();
  }

  Future<void> registerUser({
    required String invitationcode,
    required String email,
    required String password,
    required String transpassword,
    required BuildContext context,
  }) async {
    try {
      if (invitationcode.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          transpassword.isNotEmpty) {
        //save out user to auth and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        UserModel user = UserModel(
          email: email,
          invitationcode: invitationcode,
          transpassword: transpassword,
          uid: cred.user!.uid,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());

        Navigator.pop(context);
      } else {
        const snackbar = SnackBar(
          content: Text("Input All Field"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    } on FirebaseAuthException catch (e) {
      final snackbar = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    notifyListeners();
  }

  Future<void> loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          if (isRemembered) {
            log('save');
          }
        });
      } else {
        const snackbar = SnackBar(
          content: Text("Input All Field"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    } on FirebaseAuthException catch (e) {
      final snackbar = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();

    notifyListeners();
  }

  Future<void> deleteAccount() async {
    await firebaseAuth.currentUser!.delete();
    notifyListeners();
  }
}
