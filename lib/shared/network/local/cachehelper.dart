import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper {
      static late SharedPreferences sharedPreferences;
      static initi() async
      {
            sharedPreferences = await SharedPreferences.getInstance();
      }
     static Future<bool> Putboolean({required String key , required bool value})async
      {
          return await  sharedPreferences.setBool(key, value);
      }
      static bool? Getboolean({required String key })
      {
            return sharedPreferences.getBool(key);
      }
}