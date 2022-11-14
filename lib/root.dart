import 'dart:developer';

import 'package:duplotwin/providers/userprovider.dart';
import 'package:duplotwin/screens/auth/login.dart';
import 'package:duplotwin/screens/auth/register.dart';
import 'package:duplotwin/screens/homescreen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    log('root screen log');
    final firebaseuser = context.watch<UserProvider>().currentUser;

    if (firebaseuser != null) {
      log(firebaseuser.email.toString());

      return const HomeScreen();
    }

    return const LoginScreen();
  }
}
