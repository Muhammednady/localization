import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/components/app_locale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const <LocalizationsDelegate>[
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale("en"),
        Locale("ar"),
      ],
     // locale: const Locale("en"), ---1
     //localeListResolutionCallback: , ---2
     //---------------3
      localeResolutionCallback: (Locale? currLang, Iterable<Locale> suppLang) {
        if (currLang != null) {
          for (Locale locale in suppLang) {
            if (currLang.languageCode == locale.languageCode) {
              return currLang;
            }
          }
        }
        return suppLang.first;
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:  Text(getLang(context, "welcome")!),
      ),
      body: Center(
        child: Text(
          getLang(context, "name")!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
