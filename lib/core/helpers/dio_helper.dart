import 'package:dio/dio.dart';
import 'package:movies/core/helpers/shared_pref_helper.dart';
import 'package:movies/core/network/api_constants.dart';

class DioHelper {
  static Dio? _dio;
  DioHelper._();
  static Dio getDio() {
    const timeOut = Duration(seconds: 10);
    if (_dio == null) {
      _dio = Dio();
      _dio!.options = BaseOptions(
        connectTimeout: timeOut,
        sendTimeout: timeOut,
        receiveTimeout: timeOut,
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstants.baseUrl,
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'language': SharedPrefHelper.getString(SharedPrefKeys.language),
          'region': SharedPrefHelper.getString(SharedPrefKeys.region)
        },
      );

      _dio!.interceptors.add(LogInterceptor());
    }

    return _dio!;
  }

  static updateLanguageAndRegion() {
    _dio!.options.queryParameters.addAll({
      'language': SharedPrefHelper.getString(SharedPrefKeys.language),
      'region': SharedPrefHelper.getString(SharedPrefKeys.region)
    });
  }
}
