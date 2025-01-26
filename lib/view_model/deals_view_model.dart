import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/deals_model.dart';
import 'package:flutter_ecommerce_app/services/interface/app_interface.dart';
import 'package:flutter_ecommerce_app/services/manager/api_manager.dart';
import 'package:flutter_ecommerce_app/services/network/url_constant.dart';
import 'package:flutter_ecommerce_app/views/shared/utils/easy_loading.dart';

class DealsViewModels with ChangeNotifier implements AppLoading {
  ApiManager? apiManager;
  EasyLoader easyLoader = EasyLoader();

  String _counter = '';
  List<Deal> _listViewData = [];
  int _prevTab = 0;
  int _pageNo = 1;
  bool _isLoading = false;

  String get counter => _counter;
  List<Deal> get listViewData => _listViewData;
  int get prevTab => _prevTab;
  int get pageNo => _pageNo;
  bool get isLoading => _isLoading;

  setisLoadingTrue() {
    _isLoading = true;
    notifyListeners();
  }

  setisLoadingFalse() {
    _isLoading = false;
    notifyListeners();
  }

  increamentPageCount() {
    _pageNo++;
    print('Page Count >>>> $_pageNo');
  }

  resetPageCount() {
    _pageNo = 1;
    notifyListeners();
  }

  clearDealList() {
    _listViewData.clear();
  }

  setDealList(List<Deal>? listData) {
    setisLoadingFalse();
    _listViewData.addAll(listData ?? []);
    notifyListeners();
  }

  getDealsData(int tabIndex,
      {bool isRefresh = false, bool isNextPage = false}) async {
    if (_prevTab != tabIndex || isRefresh) {
      clearDealList();
    }


    _prevTab = tabIndex;
    isNextPage ? increamentPageCount() : _pageNo = 1;

    apiManager = ApiManager(this);
    print('inside getDealsData');
    easyLoader.addLoader();
    switch (tabIndex) {
      case 0:
        apiManager?.dealsManager(
            urlString: UrlConstants.topDealsUrl('$_pageNo'), type: tabIndex);
        break;
      case 1:
        apiManager?.dealsManager(
            urlString: UrlConstants.popularDealsUrl('$_pageNo'),
            type: tabIndex);
      case 2:
        apiManager?.dealsManager(
            urlString: UrlConstants.featuredDealsUrl('$pageNo'),
            type: tabIndex);
      default:
    }
  }

  @override
  void hideProgress() {
    easyLoader.removeLoader();
  }

  @override
  void isSuccessful(String resp, {int? type}) {
    DealsModel topDealsModel = DealsModel.fromJson(jsonDecode(resp));
    setDealList(topDealsModel.deals);

    switch (type) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      default:
    }
  }

  @override
  void showError(String message) {
    // const String errorMessage = "An error occurred while fetching deals.";
    // // Trigger the callback
    // showMessageCallback?.call(errorMessage);
  }

  @override
  void showProgress() {}
}
