import 'dart:io';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:wskart/Constants/ServiceList.dart';

class APIHelper {
  var _dio = Dio(
    BaseOptions(
      baseUrl: AppService.restUrl,
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 60000),
      queryParameters: {
        'consumer_key': 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835',
        'consumer_secret': 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc',
      },
    ),
  );

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool isFullResponse = false,
  }) async {
    try {
      print('response Data uri_1 : $uri');
      print('response Data queryParameters_1??? : $queryParameters');
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      print('response Data uri??? : $uri');
      print('response Data queryParameters??? : $queryParameters');
      print('response Data List??? : $response');
      return isFullResponse ? response : response.data;
    } on DioException {
      print('Brnad Data Response URL: $uri');
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
