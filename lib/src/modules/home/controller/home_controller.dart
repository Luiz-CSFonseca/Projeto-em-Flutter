import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
Future<void> consultarCep(String cep, BuildContext context) async {
  print("Iniciando a consulta do CEP: $cep");
  isLoading = true;
  errorMessage = null;
  enderecoConsultado = null;

  try {
    final resultado = await _service.consultarCep(cep);
    if (resultado != null) {
      enderecoConsultado = resultado; // Atualiza o estado
      print("Endereço consultado: $enderecoConsultado");
    } else {
      errorMessage = "CEP não encontrado!";
      print(errorMessage);
    }
  } catch (e) {
    errorMessage = "Erro ao consultar o CEP: $e";
    print(errorMessage);
  } finally {
    isLoading = false; 
    print("Consulta do CEP finalizada.");
  }
}


  // Função para traçar a rota
  @action
  Future<void> tracarRota() async {
    if (enderecoConsultado != null) {
      try {
        print("Traçando rota para: $enderecoConsultado"); // Log do endereço para traçar a rota
        await _service.tracarRota(enderecoConsultado!);
        print("Rota traçada com sucesso."); // Log de sucesso na trajetória da rota
      } catch (e) {
        print("Erro ao traçar rota: $e"); // Log do erro se a trajetória falhar
      }
    } else {
      print("Nenhum endereço consultado para traçar a rota."); // Log se não houver endereço
    }
  }

  // Função para esconder o teclado
  void esconderTeclado(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
