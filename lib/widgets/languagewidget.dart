import 'package:duplotwin/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/languageprovider.dart';

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({super.key});

  getflag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸 En';
      case 'hi':
        return '🇮🇳 Hi';
      case 'bn':
        return '🇧🇩 Bn';
      case 'zh':
        return '🇨🇳 Zh';
    }
  }

  @override
  Widget build(BuildContext context) {
    // String dropdownvalue = Localizations.localeOf(context).languageCode;

    var items = S.delegate.supportedLocales.map((e) => e.languageCode).toList();

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        icon: const SizedBox(),
        value: context.watch<LanguageProvider>().currentLocale,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Center(child: Text(getflag(items))),
            onTap: () {
              context.read<LanguageProvider>().chnageLocale = items;
            },
          );
        }).toList(),
        onChanged: (_) {
          // context.read<LanguageProvider>().chnageLocale = 'en';
        },
      ),
    );
  }
}
