import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

enum Method { post, get }
//!kantor
// const baseUrl = "http://192.168.100.236:8888/be_one_adv/api/";
// const urlImage = "http://192.168.100.236:8888/be_one_adv/fotoProfile/";

//!kos
// const baseUrl = "http://192.168.100.150:8888/be_one_adv/api/";
// const urlImage = "http://192.168.100.150:8888/be_one_adv/fotoProfile/";

// //!kos mas pur
// const baseUrl = "http://192.168.1.11:8888/be_one_adv/api/";
// const urlImage = "http://192.168.1.11:8888/be_one_adv/fotoProfile/";

//!hosting
const baseUrl = "https://oneadv.xyz/api/";
const urlImage = "https://oneadv.xyz/fotoProfile/";

class RestClient {
  final dio = Dio();

  Future<dynamic> request(
      String url, Method method, Map<String, dynamic>? params) async {
    Response response;
    // print(params);
    try {
      if (method == Method.post) {
        response = await dio.post(baseUrl + url,
            options: Options(headers: {"Content-Type": "multipart/form-data"}),
            data: FormData.fromMap(params!));
      } else {
        response = await dio.get(baseUrl + url,
            options: Options(headers: {
              'Content-Type': 'application/json',
            }),
            queryParameters: params);
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.data);
        return response.data;
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else if (response.statusCode == 400) {
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
