import 'package:dio/dio.dart';

class DioHelper {
  static  Dio dio;

  static init() {
    dio = Dio(BaseOptions(
//          baseUrl: ,
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
//        headers: {'Content-Type': 'application/json'}
        ));
  }

  static Future<Response> getData(
      {
        String url,
       Map<String, dynamic> query,
       String lang = 'ar',
       String token
      }) {
    dio.options.headers =  {'lang': lang, 'Authorization': token};
    return dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {
        String url,
      Map<String, dynamic> query,
       Map<String, dynamic> data,
      String lang = 'ar',
      String token}) {
    dio.options.headers =  {'lang': lang, 'Authorization': token};
    return dio.post(url, queryParameters: query, data: data);
  }


  static Future<Response> putData(
      {
        String url,
        Map<String, dynamic> query,
        Map<String, dynamic> data,
        String lang = 'ar',
        String token}) {
    dio.options.headers =  {'lang': lang, 'Authorization': token};
    return dio.put(url, queryParameters: query, data: data);
  }
}
