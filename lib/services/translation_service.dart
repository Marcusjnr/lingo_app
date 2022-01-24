import 'package:translator/translator.dart';

class TranslationService{
  static Future<String> translate(
      String message, String fromLanguageCode, String toLanguageCode) async {

    print('from is $fromLanguageCode to is $toLanguageCode');

    final translation = await GoogleTranslator().translate(
      message,
      from: fromLanguageCode,
      to: toLanguageCode,
    );

    print('translaction is ${translation.text}');
    return translation.text;
  }
}