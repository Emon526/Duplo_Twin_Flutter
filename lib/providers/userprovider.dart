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
  Stream<User?> get authstatechanges => firebaseAuth.idTokenChanges();

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

        // UserModel user = UserModel(
        //   email: email,
        //   invitationcode: invitationcode,
        //   transpassword: transpassword,
        //   uid: cred.user!.uid,
        // );
        // await firestore
        //     .collection('users')
        //     .doc(cred.user!.uid)
        //     .set(user.toJson())
        //     .then((value) {
        //   const snackbar = SnackBar(
        //     content: Text("SIGN UP Succesful.please log in"),
        //   );
        //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
        // });
      } else {
        const snackbar = SnackBar(
          content: Text("Input All Field"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
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
          const snackbar = SnackBar(
            content: Text("SIGN In Succesful.enjoy"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        });
      } else {
        const snackbar = SnackBar(
          content: Text("Input All Field"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
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
