import 'package:flutter_ecommerce_app/services/interface/app_interface.dart';
import 'package:flutter_ecommerce_app/services/network/api_wrapper.dart';

class ApiManager {
  AppLoading? appLoading;
  ApiManager(this.appLoading);

  dealsManager({required String urlString, required int type}) {
    try {
      ApiWrapper(
              onSuccessful: (responseDTO) async => {
                    appLoading!.isSuccessful(responseDTO, type: type),
                    appLoading!.hideProgress(),
                  },
              onProgressed: () => {
                    appLoading!.showProgress(),
                  },
              onError: (String message) =>
                  {appLoading!.hideProgress(), appLoading!.showError('error: $message')},
              urlBasic: urlString)
          .getDioResponse();
    } catch (e) {
      appLoading!.showError('$e');
      appLoading!.hideProgress();
    }
  }
}
