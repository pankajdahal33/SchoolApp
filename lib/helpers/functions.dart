import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String randomString = " RANDOMSTRING";
  static String roleId = "ROLLID";
  static String userEmail = "USEREMAIL";
  static String userPassword = "USERPASSWORD";

  static saveToken({@required String? token}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(randomString, token!);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(randomString);
  }

  static saveRoleID({@required String? roleID}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(roleId, roleID!);
  }

  static Future<String?> getRoleID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(roleId);
  }

  static saveEmail({@required String? email}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userEmail, email!);
  }

  static Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmail);
  }

  static savePassword({@required String? password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userPassword, password!);
  }

  static Future<String?> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userPassword);
  }

  static clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('Shared Preference removed Sucessfully');
  }
}
