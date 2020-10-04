import 'package:shared_preferences/shared_preferences.dart';

final loggedIn = 'loggedIn';
final userId = 'userId';
final userName = 'username';
final userMobile = 'userMobile';
final token = "access_token";


saveUserDetails(String accesstoken,String username,String mobile,String userid) async{
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  _sharedPreferences.setString(token, accesstoken);
  _sharedPreferences.setString(userName, username);
  _sharedPreferences.setString(userMobile, mobile);
  _sharedPreferences.setString(userId, userid);
  _sharedPreferences.setBool(loggedIn, true);
}

Future<bool> isLoggedIn() async
{
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  return _sharedPreferences.getBool(loggedIn);
}

Future<String> getUserId() async{
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  return _sharedPreferences.getString(userId).toString();
}

Future<String> getUserName() async{
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  return _sharedPreferences.getString(userName).toString();
}

Future<String> getUserMobile() async{
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  return _sharedPreferences.getString(userMobile).toString();
}

Future<String> getToken() async{
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  return _sharedPreferences.getString(token).toString();
}