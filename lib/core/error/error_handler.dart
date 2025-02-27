import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/error/failures.dart';
import 'package:movies/core/extensions/extension_functions.dart';
import 'package:movies/core/services/service_locator.dart';

class ErrorHandler {
  ErrorHandler._();
  static Failure handle(dynamic e) {
    switch (e.runtimeType) {
      case const (DioException):
        return _handleDioExection(e);
      // case const (FormatException):
      //   return ServerFailure(code: 'FormatException');
      // case const (WebSocketException):
      //   return ServerFailure(code: 'WebSocketException');
      // case const (HttpException):
      //   return ServerFailure(code: 'HttpException');
      // case const (SocketException):
      //   return ServerFailure(code: 'SocketException');
      default:
        log(e.toString());
        return ServerFailure(code: 0);
    }
  }

  static ServerFailure _handleDioExection(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(code: 1);
      case DioExceptionType.sendTimeout:
        return ServerFailure(code: 2);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(code: 3);
      case DioExceptionType.badCertificate:
        return ServerFailure(code: 4);
      case DioExceptionType.badResponse:
        return _handleDioStatusCode(e.response?.statusCode);
      case DioExceptionType.cancel:
        return ServerFailure(code: 5);
      case DioExceptionType.connectionError:
        return ServerFailure(code: 6);
      case DioExceptionType.unknown:
        return ServerFailure(code: 0);
    }
  }

  static ServerFailure _handleDioStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return ServerFailure(code: 400);
      case 401:
        return ServerFailure(code: 401);
      case 403:
        return ServerFailure(code: 403);
      case 404:
        return ServerFailure(code: 404);
      case 500:
        return ServerFailure(code: 500);
      case 502:
        return ServerFailure(code: 502);
      case 503:
        return ServerFailure(code: 503);
      case 504:
        return ServerFailure(code: 504);
      default:
        return ServerFailure(code: 0);
    }
  }

  static String getErrorTitle(BuildContext context, int code) {
    {
      switch (code) {
        case 0:
          return context.loc.opps_something_went_wrong;
        default:
          return context.loc.connection_error;
      }
    }
  }
}

String getErrorByCode(int code) {
  return ErrorHandler.getErrorTitle(SL.context, code);
}
