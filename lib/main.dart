import 'package:chatapp/helper/helperFunc.dart';
import 'package:chatapp/pages/Auth/LoginScreen.dart';
import 'package:chatapp/pages/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'firebase_options.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

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
  bool isSignedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserLoggedInState();
  }

  getUserLoggedInState() async {
    HelperFunctions.getUserLoggedInState()
        .then((value) => {isSignedIn = value!});
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/assets/i18n'];
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: theme,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('es', 'ES'),
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            if (supportedLocales.contains(locale)) {
              return locale;
            }

            // define pt_BR as default when de language code is 'pt'
            if (locale?.languageCode == 'pt') {
              return Locale('pt', 'BR');
            }

            // default language
            return Locale('en', 'US');
          },
          localizationsDelegates: [
            // delegate from flutter_localization
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            // delegate from localization package.
            LocalJsonLocalization.delegate,
          ],
          home: isSignedIn ? HomeScreen() : LoginScreen()),
    );
  }
}
