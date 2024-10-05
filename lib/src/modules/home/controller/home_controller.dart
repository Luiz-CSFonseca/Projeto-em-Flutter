import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:fast_location/src/modules/home/services/home_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeService _service = HomeService(Dio());

  @observable
  String? enderecoConsultado;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  // Função para consultar o CEP
  @action
  Future<void> consultarCep(String cep) async {
    isLoading = true;  // Ativa o estado de carregamento
    errorMessage = null;  // Limpa possíveis mensagens de erro
    enderecoConsultado = null;  // Limpa o último endereço consultado

    try {
      final resultado = await _service.consultarCep(cep);
      if (resultado != null) {
        enderecoConsultado = resultado;
      } else {
        errorMessage = "CEP não encontrado!";
      }
    } catch (e) {
      errorMessage = "Erro ao consultar o CEP: $e";  // Inclui detalhes do erro
    } finally {
      isLoading = false;  // Desativa o estado de carregamento após a consulta
    }
  }

  // Função para traçar a rota
  @action
  Future<void> tracarRota() async {
  if (enderecoConsultado != null) {
    try {
      print("Traçando rota para: $enderecoConsultado"); // Verifique aqui
      await _service.tracarRota(enderecoConsultado!);
    } catch (e) {
      print("Erro ao traçar rota: $e");
    }
  }
}

}
