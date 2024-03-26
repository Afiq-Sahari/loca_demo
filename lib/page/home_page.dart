import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task2/design/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final VoidCallback toggleLocale;
  final Locale currentLocale;
  const HomePage({
    Key? key,
    required this.toggleLocale,
    required this.currentLocale,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.multiLanguage),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                AppLocalizations.of(context)!.language,
                style:const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )
            ),
            Text(
              AppLocalizations.of(context)!.hello('Afeq'),
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            ElevatedButton(
              onPressed: toggleLocale,
              child: Text(
                // Change button text based on current locale
                currentLocale.languageCode == 'en' ? 'Malay' : 'English',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          theme.toggleDarkMode();
        },
        tooltip: 'Toggle dark/light mode',
        child: const Icon(Icons.visibility),
      ),
    );
  }
}
