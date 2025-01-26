import 'dart:developer' as dev;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Constants {
  static final Constants _instance = Constants._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory Constants() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  Constants._internal() {
    // initialization logic
    _init();
  }

  static void log(String msg) {
    if (Platform.isAndroid) {
      dev.log(msg);
    } else {
      print(msg);
    }
  }

  String sdcardPath = "";

  void _init() async {
    Directory? appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    sdcardPath = "${appDocDir?.path}/";
    Constants.log("sdcardPath : $sdcardPath");
    if (!await appDocDir!.exists()) {
      await appDocDir.create();
    }
  }
}
