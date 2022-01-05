import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

enum Method { post, get }

const baseUrl = "http://192.168.100.236:8888/be_one_adv/api/";

class RestClient {
  late Dio _dio;
  final dio = Dio();

  //this is for header
  static header() => {
        'Content-Type': 'application/json',
      };

  Future<RestClient> init() async {
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: header()));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (kDebugMode) {
        print('REQUEST[${options.method}] => PATH: ${options.path} '
            '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      if (kDebugMode) {
        print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
      }
      return handler.next(response);
    }, onError: (err, handler) {
      if (kDebugMode) {
        print('ERROR[${err.response?.statusCode}]');
      }
      return handler.next(err);
    }));
  }

  Future<dynamic> request(
      String url, Method method, Map<String, dynamic>? params) async {
    Response response;

    try {
      if (method == Method.post) {
        response = await dio.get(baseUrl + url,
            options: Options(headers: {"Content-Type": "multipart/form-data"}),
            queryParameters: params);
      } else {
        response = await dio.get(baseUrl + url,
            options: Options(headers: {
              'Content-Type': 'application/json',
            }),
            queryParameters: params);
      }

      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something Went Wrong");
      }
    } on SocketException {
      throw Exception("No Internet Connection");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } on DioError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception("Something Went Wrong");
    }
  }
}
