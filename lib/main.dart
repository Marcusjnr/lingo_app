import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:lingo_app/localization/demolocalization.dart';
import 'package:lingo_app/providers/language_change_provider.dart';
import 'package:lingo_app/screens/splash_screen.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:provider/provider.dart';

import 'localization/local_constant.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
      const Locale('en', 'UK'), // English, no country code
      const Locale('ig', 'NG'), // Igbo, no country code
      const Locale('ha', 'NG'),
      const Locale('yo', 'NG'),
    ],
    path: 'resources/langs',
    // fallbackLocale: Locale('en', 'US'),
    // startLocale: Locale('de', 'DE'),
    saveLocale: true,
    // useOnlyLangCode: true,

    // optional assetLoader default used is RootBundleAssetLoader which uses flutter's assetloader
    // install easy_localization_loader for enable custom loaders
    // assetLoader: RootBundleAssetLoader()
    // assetLoader: HttpAssetLoader()
    // assetLoader: FileAssetLoader()
    // assetLoader: CsvAssetLoader()
    // assetLoader: YamlAssetLoader() //multiple files
    // assetLoader: YamlSingleAssetLoader() //single file
    // assetLoader: XmlAssetLoader() //multiple files
    // assetLoader: XmlSingleAssetLoader() //single file
    // assetLoader: CodegenLoader()
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale locale){
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageChangeProvider()),
      ],
      child: this._locale == null ?
        Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800])),
        ),
      )
   :
    MaterialApp(
        title: app_name,
        localizationsDelegates:  context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: appTheme,
        locale: _locale,
        localeResolutionCallback: (deviceLocale, supportedLocales){
          for(var locale in supportedLocales){
            if(locale.languageCode == deviceLocale.languageCode && locale.countryCode == deviceLocale.countryCode){
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        home: SplashScreen(), //Display the splash screen
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

