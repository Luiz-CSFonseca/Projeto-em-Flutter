import 'package:flutter/material.dart';
import '../model/endereco_model.dart';

class UltimoEnderecoComponent extends StatelessWidget {
  final EnderecoModel? endereco;

  UltimoEnderecoComponent({this.endereco});

  @override
  Widget build(BuildContext context) {
    if (endereco == null) {
      return Text('Nenhum endereço consultado ainda.');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Último Endereço:'),
        Text('${endereco!.logradouro}, ${endereco!.bairro}, ${endereco!.localidade} - ${endereco!.uf}'),
      ],
    );
  }
}
