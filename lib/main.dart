import 'package:best_hundred_books/core/constants/constant_shelf.dart';
import 'package:best_hundred_books/core/provider/theme_provider.dart';
import 'package:best_hundred_books/core/service/data_service.dart';
import 'package:best_hundred_books/screen/splash/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await init();
  runApp(EasyLocalization(
      path: LangConstants.LANG_PATH,
      supportedLocales: LangConstants.SUPPORTED_LOCALE,
      useOnlyLangCode: true,
      fallbackLocale: LangConstants.EN_LOCALE,
      child: MyApp()));
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataService>(create: (context) => DataService()),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          theme: value.theme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: TextConstant().title,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
