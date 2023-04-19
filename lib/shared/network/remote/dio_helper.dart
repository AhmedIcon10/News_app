import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
    static Future<Response> getData({
      required String url,
      required Map<String, dynamic> query,
    }) async{
      return await dio!.get(url,queryParameters: query);
    }

}
// apiKey: 13365e4851cb4320b7a66229fa7022c8
//https://newsapi.org/v2/everything?q=tesla&from=2021-11-20&sortBy=publishedAt&apiKey=13365e4851cb4320b7a66229fa7022c8
// https://newsapi.org/
// v2/everything?
// q=tesla&
// from=2021-11-20&
// sortBy=publishedAt&
// apiKey=13365e4851cb4320b7a66229fa7022c8