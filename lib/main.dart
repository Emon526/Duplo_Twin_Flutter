import 'package:duplotwin/screens/auth/login.dart';
import 'package:duplotwin/screens/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'consts/style.dart';
import 'homepage.dart';
import 'providers/languageprovider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LanguageProvider languageProvider = LanguageProvider();
  void checkCurrentTheme() async {
    languageProvider.chnageLocale =
        await languageProvider.languagePreference.getLanguage();
  }

  @override
  void initState() {
    checkCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => languageProvider,
        )
      ],
      builder: (context, child) {
        // log(context.watch<LanguageProvider>().currentLocale);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(
              context.watch<LanguageProvider>().isDarkMode, context),
          locale: Locale(context.watch<LanguageProvider>().currentLocale, ''),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: 'Duplo Twin',
          home: const RegisterScreen(),
        );
      },
    );
  }
}
