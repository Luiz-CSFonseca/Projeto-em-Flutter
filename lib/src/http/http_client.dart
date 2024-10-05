import 'package:dio/dio.dart';

class HttpClient {
  final Dio dio = Dio();

  HttpClient() {
    dio.options.baseUrl = 'https://viacep.com.br/ws';
  }

  Future<Response> getCep(String cep) async {
    return await dio.get('/$cep/json/');
  }
}
