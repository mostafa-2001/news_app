import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Diohleper {

  static late Dio dio;

  static init()
  {
      dio = Dio(
           BaseOptions(
                 baseUrl: 'https://newsapi.org/',
                 receiveDataWhenStatusError: true
           )
      );
  }

 static Future<Response> getdata( {required String url , required Map<String,dynamic>querys })async
  {
            return await dio.get(url,queryParameters: querys);
  }


}