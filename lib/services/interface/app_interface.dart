abstract class AppLoading {
  void isSuccessful(String response, {int type});

  void hideProgress();

  void showProgress();

  void showError(String message);
}
