import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'providers/languageprovider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.welcomeText),
            ElevatedButton(
              onPressed: () {
                context.read<LanguageProvider>().chnageLocale = 'hi';
              },
              child: const Text('Hindi'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LanguageProvider>().chnageLocale = 'en';
              },
              child: const Text('English'),
            ),
          ],
        ),
      ),
    );
  }
}
