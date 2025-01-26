import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_app/services/network/api_client.dart';

typedef OnSuccessful = Function(String response);
typedef OnProgressed = Function();
typedef OnError = Function(String errorMessage);

class ApiWrapper {
  final OnSuccessful onSuccessful;
  final OnProgressed onProgressed;
  final OnError onError;
  final String urlBasic;

  ApiWrapper({
    required this.onSuccessful,
    required this.onProgressed,
    required this.onError,
    required this.urlBasic,
  });

  getDioResponse() async {
    try {
      onProgressed();
      ApiClient apiClient = ApiClient.defaultClient();

      // Add headers
      var headers = {
        'X-Desidime-Client': '08b4260e5585f282d1bd9d085e743fd9',
      };
      print('getDioResponse service call >>> $urlBasic');
      // Make the GET request with headers
      final response = await apiClient.dioClient?.get(
        urlBasic,
        options: Options(headers: headers),
      );
      print('Raw response >>>>>  ${response}');
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        print('response >>>>>  ${response?.data}');
        onSuccessful(jsonEncode(response?.data));
      } else {
        onError(response?.statusMessage.toString() ?? '');
      }
    } catch (e) {
      print('Error >>>>>  $e');
      onError('Error: $e');
    }
  }
}
