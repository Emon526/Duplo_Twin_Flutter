import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/languageprovider.dart';
import '../widgets/custombutton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              print('call');
              context.read<LanguageProvider>().chnageLocale = 'en';
            },
            child: const Icon(Icons.headset_mic_outlined)),
        title: Image.asset(
          'assets/inapplogo.png',
          height: size.height * 0.1,
          // width: 100,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
                onTap: () {
                  context.read<LanguageProvider>().chnageLocale = 'hi';
                  print('translate');
                },
                child: const Icon(Icons.translate)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              height: size.height * 0.3,
              child: Text(
                AppLocalizations.of(context)!.announcementText,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            CustomButton(
              ontap: () {},
              buttontext: AppLocalizations.of(context)!.deposit,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomButton(
              ontap: () {},
              buttontext: AppLocalizations.of(context)!.withdrawal,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomButton(
              ontap: () {},
              buttontext: AppLocalizations.of(context)!.salaryDescription,
            ),
          ],
        ),
      ),
    );
  }
}
