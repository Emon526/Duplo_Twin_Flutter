import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/userprovider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          context.watch<UserProvider>().currentUser!.email!,
        ),
      ),
    );
  }
}
