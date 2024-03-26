import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task2/l10n/l10n.dart';
import 'package:task2/page/home_page.dart';
import 'package:task2/design/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentLocaleIndex = 0;

  void _toggleLocale() {
    setState(() {
      _currentLocaleIndex = (_currentLocaleIndex + 1) % L10n.all.length as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: Consumer<ThemeProvider>(builder: (context, th, _) {
        return MaterialApp(
          theme: th.isDarkMode
              ? ThemeData.dark()
              : ThemeData(
            cardColor: Colors.cyanAccent,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          supportedLocales: L10n.all,
          locale: L10n.all[_currentLocaleIndex],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: HomePage(
            toggleLocale: _toggleLocale,
            currentLocale: L10n.all[_currentLocaleIndex],
          ),
        );
      }),
    );
  }
}
