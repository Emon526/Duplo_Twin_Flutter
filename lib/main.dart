import 'package:duplotwin/providers/userprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'consts/style.dart';
import 'firebase_options.dart';
import 'providers/languageprovider.dart';
import 'screens/auth/register.dart';
import 'screens/auth/resetpassword.dart';
import 'screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
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
