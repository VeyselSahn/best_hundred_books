import 'package:best_hundred_books/core/constants/constant_shelf.dart';
import 'package:best_hundred_books/core/provider/theme_provider.dart';
import 'package:best_hundred_books/core/service/data_service.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

AppBar appbar(BuildContext context, DataService service) {
  List<String> choices = [
    TextConstant().changeTheme,
    TextConstant().changeLanguage
  ];

  return AppBar(
    title: Text(TextConstant().title),
    centerTitle: true,
    actions: [
      PopupMenuButton<String>(itemBuilder: (BuildContext context) {
        return choices.map((String choice) {
          return PopupMenuItem<String>(
            onTap: () => choiceAction(choice, context),
            value: choice,
            child: Text(choice),
          );
        }).toList();
      })
    ],
    elevation: 0,
  );
}

void choiceAction(String choice, BuildContext context) {
  if (choice == TextConstant().changeTheme) {
    Provider.of<ThemeProvider>(context, listen: false).changeTheme();
  } else if (choice == TextConstant().changeLanguage) {
    context.locale == Locale('en')
        ? context.setLocale(Locale('tr'))
        : context.setLocale(Locale('en'));
  } else {
    null;
  }
}
