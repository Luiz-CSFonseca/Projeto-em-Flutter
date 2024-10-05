import 'package:dio/dio.dart';
import '../model/endereco_model.dart';

class EnderecoRepository {
  final Dio dio = Dio();

  EnderecoRepository() {
    dio.options.baseUrl = 'https://viacep.com.br/ws';
  }

  // Método para buscar endereço por CEP
  Future<EnderecoModel?> buscarPorCep(String cep) async {
    try {
      final response = await dio.get('/$cep/json/');
      if (response.statusCode == 200 && response.data != null) {
        return EnderecoModel.fromJson(response.data);
      }
    } catch (e) {
      print('Erro ao buscar CEP: $e');
    }
    return null;  // Retorna null em caso de erro
  }
}
