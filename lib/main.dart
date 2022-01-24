import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lingo_app/providers/language_change_provider.dart';
import 'package:lingo_app/screens/challenge_quiz_page.dart';
import 'package:lingo_app/screens/forgot_password.dart';
import 'package:lingo_app/screens/home.dart';
import 'package:lingo_app/screens/learn_page_quiz.dart';
import 'package:lingo_app/screens/onboarding_screen.dart';
import 'package:lingo_app/screens/sign_in_screen.dart';
import 'package:lingo_app/screens/sign_up_screen.dart';
import 'package:lingo_app/screens/splash_screen.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:lingo_app/translations/codegen_loader.g.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
      const Locale('de'), // English, no country code
      const Locale('en'), // Igbo, no country code
      const Locale('fr'),
      const Locale('ru'),
    ],
    path: 'assets/languages',
    assetLoader: CodegenLoader(),
    fallbackLocale: Locale('en', 'US'),
    // startLocale: Locale('de', 'DE'),
    saveLocale: true,
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageChangeProvider()), //Manages the state of the language changed.
      ],
      child: MaterialApp(
        title: app_name,
        localizationsDelegates: context.localizationDelegates, //Initialize the languages
        supportedLocales: context.supportedLocales, //List of supported Languages
        theme: appTheme, //Application Theme
        initialRoute: SplashScreen.id, //Displays the splash screen first at launch.
        routes: { //List all the application routes.
          SplashScreen.id: (context) => SplashScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          ForgotPassword.id: (context) => ForgotPassword(),
          OnBoardingScreen.id: (context) => OnBoardingScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          ChallengeQuizPage.id: (context) => ChallengeQuizPage(),
        },
        locale: context.locale, //Initializes the locale of the user's location
        home: SplashScreen(), //Display the splash screen, application's starting point.
        debugShowCheckedModeBanner: false, //Debug Banner Display
      ),
    );
  }
}

