import 'package:wskart/Constants/ServiceList.dart';
import 'package:wskart/Service/Helper/PersistHelper.dart';
import 'package:wskart/Constants/Debug.dart';
import 'package:wskart/Constants/GenOauthSignature.dart';
import 'package:dio/dio.dart';
import 'package:wskart/Service/Helper/RequestHelper.dart';

abstract class NetworkLocator {
  RequestHelper get providerRequestHelper;
}

class NetworkModule {
  NetworkModule();

  Dio provideDio(PersistHelper sharedPrefHelper) {
    final dio = Dio();

    dio
      ..options.baseUrl = AppService.restUrl
      ..options.connectTimeout =
          const Duration(seconds: AppService.connectionTimeout)
      ..options.receiveTimeout =
          const Duration(seconds: AppService.receiveTimeout)
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        error: false,
        logPrint: (error) => avoidPrint(error),
        request: false,
        requestBody: false,
        requestHeader: false,
        responseHeader: false,
        responseBody: false,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
            if (isAllowPassRestApiKeys(options.path)) {
              if (AppService.restUrl.indexOf('https://') == 0) {
                options.queryParameters.addAll({
                  "consumer_key": AppService.consumerKey,
                  "consumer_secret": AppService.consumerSecret,
                });
              } else {
                GenOauthSignature genOauthSignature = GenOauthSignature(
                  consumerKey: AppService.consumerKey,
                  url: '${AppService.restUrl}${options.path}',
                  consumerKeySecret: AppService.consumerSecret,
                  requestMethod: options.method,
                );
                Map<String, String> data =
                    Map<String, String>.of(options.uri.queryParameters);
                Map<String, String> queryParameters =
                    genOauthSignature.generate(data);
                options.queryParameters.addAll(queryParameters);
              }
            } else {
              // getting token
              String? token = sharedPrefHelper.getToken();
              if (token != null) {
                options.headers
                    .putIfAbsent('Authorization', () => 'Bearer $token');
              }
            }

            return handler.next(options);
          },
        ),
      );

    // if (!const bool.fromEnvironment('dart.library.js_util')) {
    //   CookieService cookieService = CookieService(sharedPrefHelper);
    //   dio.interceptors.add(CookieManager(cookieService.persistCookieJar));
    // }

    return dio;
  }

  /// A singleton dio_client provider.
  ///
  /// Calling it multiple times will return the same instance.
  DioClient provideDioClient(Dio dio) => DioClient(dio);

  // DI Providers:--------------------------------------------------------------
  /// A singleton preference provider.
  ///
  /// Calling it multiple times will return the same instance.
  RequestHelper provideRequestHelper(DioClient dioClient) =>
      RequestHelper(dioClient);
}

class DioClient {
  // dio instance
  final Dio _dio;

  // injecting dio instance
  DioClient(this._dio);

  // Get: --------------------------------------------------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool isFullResponse = false,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return isFullResponse ? response : response.data;
    } on DioException {
      rethrow;
    }
  }

  // Post: -------------------------------------------------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  // Put: -------------------------------------------------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  // Delete: -------------------------------------------------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }
}
