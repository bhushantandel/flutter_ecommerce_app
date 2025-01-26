// import 'package:bandhan_distributor_app/shared/utils/shared_prefrence_keys.dart';
import 'package:flutter_ecommerce_app/views/shared/constants/app_logs.dart';
import 'package:flutter_ecommerce_app/views/shared/constants/shared_prefrence_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static SharedPreferenceUtils sharedPreferenceUtils = SharedPreferenceUtils();
  static SharedPreferences? prefs;

  static initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
    AppLogs.printLog("Intialized Shared Pref");
  }

  static setUserData(String data) async {
    if (prefs != null) {
      await prefs?.setString(SharedPrefKeys.setuserData, data);
    } else {
      initSharedPref();
      await prefs?.setString(SharedPrefKeys.setuserData, data);
    }
  }

  static Future<String?> getUserData() async {
    if (prefs != null) {
      return prefs?.getString(SharedPrefKeys.setuserData);
    } else {
      initSharedPref();
      return prefs?.getString(SharedPrefKeys.setuserData);
    }
  }
}
