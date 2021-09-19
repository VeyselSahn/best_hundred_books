import 'package:best_hundred_books/core/theme/theme_shelf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData theme = ThemeData.dark();

  void changeTheme() {
    theme == getDarkTheme() ? theme = getLightTheme() : theme = getDarkTheme();
    notifyListeners();
  }
}
