import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class sharedHelper {

 static  SharedPreferences preferences;

  static Future initShared() async{
    preferences = await SharedPreferences.getInstance();
  }
}
