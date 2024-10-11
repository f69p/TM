
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
 static final String _accessToken='access-token';
  static String?accessToken;


 static Future<void>saveAccessToken(String token)async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  await sharedPreferences.setString(_accessToken, token);
  accessToken=token;
  }
 static Future<String?>getAccessToken()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String?token= sharedPreferences.getString(_accessToken);
    accessToken =token;
    return token;
  }
  static bool isLoggedIn(){
    return accessToken!=null;
  }


 static Future<void>clearUserData()async {
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   await sharedPreferences.clear();
   accessToken=null;
 }

}