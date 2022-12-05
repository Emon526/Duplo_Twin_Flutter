import 'package:duplotwin/widgets/languagewidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/userprovider.dart';
import '../widgets/custombutton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              print('call');
            },
            child: const Icon(Icons.headset_mic_outlined)),
        title: Image.asset(
          'assets/inapplogo.png',
          height: size.height * 0.1,
          // width: 100,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: LanguagePickerWidget(),
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
              ontap: () {
                context.read<UserProvider>().signOut();
              },
              buttontext: AppLocalizations.of(context)!.deposit,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomButton(
              ontap: () {
                context.read<UserProvider>().deleteAccount();
              },
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
