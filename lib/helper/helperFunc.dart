import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{

  static String userLogedinKey="LogedinKey";
  static String userNameKey="NameKey";
  static String userEmailKey="EmailKey";

  static Future<bool?> getUserLoggedInState() async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    return sharedPreferences.getBool(userLogedinKey);
  }

  static Future<bool> saveUserLoginState(bool isLoggedIn) async
  {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(userLogedinKey, isLoggedIn);
  }

  static Future<bool> saveUserName(String fName) async
  {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    return await sharedPreferences.setString(userNameKey, fName);
  }

  static Future<bool> saveUserEmail(String email) async
  {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    return await sharedPreferences.setString(userEmailKey, email);
  }
}