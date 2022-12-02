import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';

  static Future setEmail(String email)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
   await pref.setString(_keyEmail, email);
  }

  static Future setPassword(String password)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(_keyPassword, password);
  }

  static Future<String> getEmail()async{
    String name ='';
    SharedPreferences pref = await SharedPreferences.getInstance();
    name = pref.getString(_keyEmail) ?? '';
    return name;
  }
}