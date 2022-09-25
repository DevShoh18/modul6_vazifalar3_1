import 'dart:convert';

import 'package:modul6_vazifalar3_1/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsAccount{
  static storedAccount(Account account) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String stringAccount = jsonEncode(account);
    preferences.setString('account', stringAccount);
  }
  static Future<Account?> storedAccountload() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accounttemp = await preferences.getString('account');
    if(accounttemp!.isEmpty || accounttemp==null){
      return null;
    }
    Map<String, dynamic> map = jsonDecode(accounttemp);
    return Account.fromJson(map);
  }
  static storedAccountremove() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('account');
  }
}