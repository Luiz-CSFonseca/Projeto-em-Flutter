import 'package:flutter/material.dart';
import '../model/endereco_model.dart';

class ListEnderecosComponent extends StatelessWidget {
  final List<EnderecoModel> enderecos;

  ListEnderecosComponent({required this.enderecos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: enderecos.length,
      itemBuilder: (context, index) {
        final endereco = enderecos[index];
        return ListTile(
          title: Text('${endereco.logradouro}, ${endereco.bairro}'),
          subtitle: Text('${endereco.localidade} - ${endereco.uf}'),
        );
      },
    );
  }
}
