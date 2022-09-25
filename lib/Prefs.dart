
import 'dart:convert';

import 'package:modul6_vazifalar3_1/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pref{


  static storedUser(User user) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    preferences.setString('user', stringUser);
  }
  static Future<User?> storedUserload() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? stringUser = preferences.getString('user');
    if(stringUser==null || stringUser.isEmpty){
      return null;
    }
    Map<String, dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }
  static storedUserremove() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('user');
  }
}