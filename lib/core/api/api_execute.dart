import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../common/result.dart';
import '../error/failures.dart';
import '../utils/constant_manager.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    bool isConnected = await InternetConnectionChecker.instance.hasConnection;
    if (isConnected) {
      var result = await apiCall.call();
      return Success(result);
    } else {
      return Error(AppConstants.internetConnectionError);
    }
  } catch (ex) {
    if (ex is DioException) {
      debugPrint(ex.response?.statusCode.toString());
      debugPrint(ex.response?.data.toString());
      log(ex.message.toString());
      log(ex.error.toString());
      log('error 1');
      log(ServerFailure.fromDioException(ex).errorMessage);
      return Error(ServerFailure.fromDioException(ex).errorMessage);
    } else if (ex is ServerFailure) {
      log('error 2');

      log(ex.errorMessage.toString());
      return Error(ServerFailure(errorMessage: ex.errorMessage).errorMessage);
    } else {
      log('error 3');

      log(ex.toString());

      return Error(ex.toString());
    }
  }
}
