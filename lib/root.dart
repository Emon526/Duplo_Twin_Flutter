import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'buttomnavbar.dart';
import 'providers/userprovider.dart';
import 'screens/auth/login.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<UserProvider>().currentUser;

    if (firebaseuser != null) {
      return const ButtomNavBar();
    }

    return const LoginScreen();
  }
}
